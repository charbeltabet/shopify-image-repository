class RemovePathAndDescriptionFromImage < ActiveRecord::Migration[6.1]
  def change
    change_table :images do |t|
      t.remove :description, :path
    end
  end
end
