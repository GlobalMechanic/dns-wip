class Page < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :assets, :order => 'created_at ASC', :dependent => :destroy
  self.primary_key = 'slug'
  before_create :set_hash
 
  def set_hash
    self.slug = SecureRandom.hex 4
  end
end
