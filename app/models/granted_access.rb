class GrantedAccess < ApplicationRecord
  belongs_to :image
  validates :image_id, presence: true

  belongs_to :user
  validates :user_id, presence: true

  attribute :action, :string
  validates :action, presence: true, uniqueness: { scope: [:image_id, :user_id], message: "Access already exists" }
end
