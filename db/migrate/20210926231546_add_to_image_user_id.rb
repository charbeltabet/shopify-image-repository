class AddToImageUserId < ActiveRecord::Migration[6.1]
  def change
    add_reference :images, :user, index: true
  end
end
