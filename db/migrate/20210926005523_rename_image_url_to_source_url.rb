class RenameImageUrlToSourceUrl < ActiveRecord::Migration[6.1]
  def change
    rename_column :images, :url, :source_url
  end
end
