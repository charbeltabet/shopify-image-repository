class RenameUserHashedApiKeyToCipheredApiKey < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :hashed_api_key, :ciphered_api_key
  end
end
