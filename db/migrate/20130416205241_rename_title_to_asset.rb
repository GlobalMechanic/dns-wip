class RenameTitleToAsset < ActiveRecord::Migration
  def change
    rename_column :assets, :title, :asset
  end
end
