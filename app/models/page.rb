class Page < ActiveRecord::Base
  attr_accessible :description, :title

  #has_many :assets
end
