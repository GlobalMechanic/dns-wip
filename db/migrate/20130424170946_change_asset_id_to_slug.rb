class ChangeAssetIdToSlug < ActiveRecord::Migration
  def up
    change_column :assets, :page_id, :string
  end

  def down
    change_column :assets, :page_id, :integer
  end
end
