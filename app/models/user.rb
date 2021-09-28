class User < ApplicationRecord
  has_many :images, dependent: :delete_all
  has_many :granted_accesses, dependent: :delete_all

  attribute :first_name, :string, default: "First Name"
  validates :first_name, presence: true

  attribute :last_name, :string, default: "Last Name"
  validates :last_name, presence: true

  attribute :username, :string
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  attribute :is_superuser, :boolean, default: 0

  attribute :ciphered_api_key, :string
  validates :ciphered_api_key, presence: true

  before_validation :strip_username

  def self.create_with_api_key(**kwargs)
    api_key = srand.to_s

    user = self.new(kwargs)
    user.ciphered_api_key = self.encrypted_hashed_secret(secret: api_key)
    user.save

    { user: user, api_key: api_key }
  end

  def self.find_by_api_key(secret)
    User.find_by(ciphered_api_key: self.encrypted_hashed_secret(secret: secret))
  end

  def self.superuser_exists?(user_id)
    User.exists?(id: user_id, is_superuser: 1)
  end

  def allowed_to_proceed?(image_id:, action:)
    return true if self.is_superuser

    is_superuser? || owns_image?(image_id) || has_granted_access?(image_id, action)
  end

  def owns_image?(image_id)
    self.images.exists?(image_id)
  end

  def has_granted_access?(image_id, action)
    !Image.find(image_id).is_action_protected?(action) || GrantedAccess.exists?(image_id: image_id, user_id: self.id, action: action)
  end

  private

  def self.encrypted_hashed_secret(secret:, hashing_algorithm: 'sha256', encryption_algorithm: 'aes-256-cbc')
    hashed_secret = self.hash_secret(secret: secret, hashing_algorithm: hashing_algorithm)
    self.encrypt_secret(secret: secret, encryption_algorithm: encryption_algorithm)
  end 

  def self.hash_secret(secret:, hashing_algorithm: 'sha256')
    engine = OpenSSL::Digest.new(hashing_algorithm)
    result = engine.digest(secret)
    Base64.encode64(result).to_s.strip
  end

  def self.encrypt_secret(secret:, encryption_algorithm: 'aes-256-cbc')
    cipher = OpenSSL::Cipher.new(encryption_algorithm)
    cipher.encrypt
    cipher.iv = ENV["aes_encryption_iv"]
    cipher.key = ENV["aes_encryption_key"]
    encrypted_secret = cipher.update(secret) + cipher.final
    Base64.encode64(encrypted_secret).to_s.strip
  end

  def strip_username
    self.username = self.username.delete(' ').downcase
  end
end
