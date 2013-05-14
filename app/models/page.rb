class Page < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :assets, :order => '"order" ASC', :dependent => :destroy
  self.primary_key = 'slug'
  before_create :set_hash
 
  def set_hash
    self.slug = SecureRandom.urlsafe_base64 4
  end
end
