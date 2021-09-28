class CreateGrantedAccesses < ActiveRecord::Migration[6.1]
  def change
    create_table :granted_accesses do |t|
      t.references :image
      t.references :user
      t.string :action

      t.timestamps
    end
  end
end
