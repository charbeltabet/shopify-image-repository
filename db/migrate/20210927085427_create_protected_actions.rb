class CreateProtectedActions < ActiveRecord::Migration[6.1]
  def change
    create_table :protected_actions do |t|
      t.references :image
      t.string :action

      t.timestamps
    end
  end
end
