class Asset < ActiveRecord::Base
	attr_accessible :description, :asset, :asset_cache, :page_id
  mount_uploader :asset, AssetUploader
	belongs_to :page
end
