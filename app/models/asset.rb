class Asset < ActiveRecord::Base
	attr_accessible :description, :title

	belongs_to :page
end