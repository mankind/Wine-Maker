class Winery < ActiveRecord::Base

  has_many :wines, :order => 'name ASC, year ASC'
   
  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 255}
  validates :city, :length => {:maximum => 255}
  validates :state, :length => {:maximum => 255}
  validates :country, :length => {:maximum => 255}
  
  def location
    return[city,state, country].compact.join(",")
  end
  
end
