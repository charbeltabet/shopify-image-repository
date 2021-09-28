class AddToUserUsername < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :username, unique: true
    end
  end
end
