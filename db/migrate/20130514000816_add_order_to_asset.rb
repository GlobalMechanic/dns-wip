class AddOrderToAsset < ActiveRecord::Migration
  def up
    add_column :assets, :order, :integer
    Asset.all.each do |asset|
      asset.update_attributes(order: asset.id)
    end
  end

  def down
    remove_column :assets, :order
  end
end
