class RenamingImageUuidAndVisual < ActiveRecord::Migration[6.1]
  def change
    rename_column :images, :uuid, :unique_name
  end
end
