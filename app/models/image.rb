require "open-uri"

class Image < ApplicationRecord
  has_many :granted_accesses, dependent: :delete_all
  has_many :protected_actions, dependent: :delete_all 

  has_one_attached :visual, dependent: :purge_later
  validates :visual,
            content_type: [:gif, :png, :jpg, :jpeg],
            size: { less_than: 5.megabytes , message: 'must be less than 5MB in size' }

  belongs_to :user
  validates :user_id, presence: true
          
  attribute :title, :string, default: "untitled_image"
  validates :title, presence: true

  attribute :source_url, :string, default: "https://picsum.photos/600/400"
  validates :source_url, presence: true

  attr_readonly :unique_name, :string
  validates :unique_name, presence: true

  validates_with ImageValidator

  before_validation :generate_unique_name
  before_save :actualize_attachment
  after_create :set_default_protected_actions

  DEFAULT_PROTECTED_ACTIONS = [:update, :destroy, :transfer_ownership]
  PROTECTABLE_ACTIONS = ImagesController.action_methods.to_a.reject { |a| [:create, :index].include? a }

  def binary
    return unless self.visual.attached?

    self.visual.attachment.download
  end

  def extension
    self.visual.attachment.filename.extension
  end

  def protect_action(action_method)
    self.protected_actions.create(action: action_method)
  end

  def set_default_protected_actions
    DEFAULT_PROTECTED_ACTIONS.each do |action_method|
      protect_action(action_method)
    end
  end

  def privatize
    PROTECTABLE_ACTIONS.each do |action_method|
      protect_action(action_method)
    end
  end

  def publicize
    self.protected_actions.destroy_all
  end

  def ownership_transfer(new_user_id)
    self.update(user_id: new_user_id)
  end
  
  def is_public?
    protected_actions.empty?
  end

  def is_protected?
    protected_actions.any?
  end

  def is_action_protected?(action)
    protected_actions.exists?(action: action)
  end

  def is_action_unprotected?(action)
    !is_action_protected?(action)
  end

  def is_private?
    ImagesController.action_methods.all? do |action_method|
      protected_actions.exists?(action: action_method)
    end
  end

  def can_user_take_action?(user_id:, action:)
    User.superuser_exists?(user_id) || self.user_id == user_id || is_action_unprotected?(action) || granted_accesses.exists?(user_id: user_id, action: action)
  end

  private

  def attach(io: attachment_io)
    self.visual.attach(io: io, filename: "#{title}.#{attachment_extension}")
  end

  def actualize_attachment
    attach if self.changes.include? :source_url
  end

  def attachment_io
    image_io = Tempfile.new([title, attachment_extension], encoding: "ASCII-8BIT")
    image_io.write(attachment_binary)
    image_io.rewind
    image_io
  end

  def attachment_extension
    url_extname = File.extname(URI.parse(source_url).path)
    url_extname.blank? ? ".jpg" : url_extname
  end

  def attachment_binary
    URI.open(source_url).read
  end

  def generate_unique_name
    unique_title = title.gsub(" ", "_")
    unique_name = "#{unique_title}_#{UUID.generate.split("-")[0]}"
    self.unique_name = "#{unique_name}#{attachment_extension}" if self.unique_name.nil?
  end
end
