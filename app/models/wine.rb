class Wine < ActiveRecord::Base

  belongs_to :winery

  #scope :find_newest, where('year IS NOT NULL').order('year DESC')
  scope :find_oldest, where('year IS NOT NULL').order('year ASC')

  validates :name, :presence => true, :length => {:maximum => 100}
  validates :family, :presence => true, :length => {:maximum => 100}
  validates :year, :presence => true, :format => {:with => /^\d{4}$/, :message => 'must be a four-digit number'}

  FAMILIES = [
    "Cabernet sauvignon",
    "Merlot",
    "Pinot Noir",
    "Chardonnay",
    " Blanc"
 ].freeze

  def self.current_families
    all_wines = self.order('family Asc')
    return all_wines.collect {|w| w.family}.uniq!
  end
  
  def self.find_newest
    self.where('year IS NOT NULL').order('year DESC')
  end

  #def self.find_oldest
   # self.where('year IS NOT NULL').order('year ASC')
  #end

  def age
    Time.now.year - self.year
  end

  def is_antique?
    self.age >= 75 ? true : false
  end
end
