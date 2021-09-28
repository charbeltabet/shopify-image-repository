class RemoveFromImageHashedApiKey < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :hashed_api_key
    add_column :users, :hashed_api_key, :string
  end
end
