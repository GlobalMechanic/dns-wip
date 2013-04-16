class Asset < ActiveRecord::Base
	attr_accessible :description, :title, :page_id
	belongs_to :page
end
