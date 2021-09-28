class AddUrlToImage < ActiveRecord::Migration[6.1]
  def change
    change_table :images do |t|
      t.string :url
    end
  end
end
