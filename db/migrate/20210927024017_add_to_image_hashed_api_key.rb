class AddToImageHashedApiKey < ActiveRecord::Migration[6.1]
  def change
    change_table :images do |t|
      t.string :hashed_api_key
    end
  end
end
