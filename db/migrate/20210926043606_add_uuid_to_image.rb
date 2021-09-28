class AddUuidToImage < ActiveRecord::Migration[6.1]
  def change
    change_table :images do |t|
      t.string :uuid
    end
  end
end
