class ProtectedAction < ApplicationRecord
  belongs_to :image
  validates :image_id, presence: true

  attribute :action, :string
  validates :action, presence: true, uniqueness: { scope: :image_id, message: "Action already protected" }
end
