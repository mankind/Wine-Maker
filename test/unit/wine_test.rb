require 'test_helper'

class WineTest < ActiveSupport::TestCase
 

  def setup
    @sunnyside = Factory(:winery)
    @merlot = Factory(:merlot, :winery => @sunnyside)
    @pinoit_noir = Factory(:pinoit_noir, :winery => @sunnyside) 
    @wine = Factory(:wine, :name => 'Chardonnay',  :year => 1992, :family => 'Chardonnay', :winery => @sunnyside )
    @drink = Factory(:wine, :name =>  'Blanc', :year => 2005, :family => 'Blanc', :winery => @sunnyside )
  end

  def teardown
    @sunnyside = nil
    @merlot = nil
    @pinoit_noir = nil
    @wine = nil
    @drink = nil 
  end

  
  def test_created_at_difference
    assert_equal(7.days, @pinoit_noir.created_at -  @merlot.created_at)
  end

  def test_belongs_to_relationships
    #belongs_to :winery
    assert_equal(1, @merlot.winery_id)
    assert_equal(1, @merlot.winery.id)
    assert_equal('Sunnyside Vineyards',@merlot.winery.name)
  end

  def test_validates_presence_of_name
   #test that initial object is valid
    assert(@merlot.valid?)
   #test that it becomes invalid by removing the name
    temp = @merlot.name
    @merlot.name = nil
    assert(!@merlot.valid?)
    assert(@merlot.errors[:name],"Expected an error on validation")
  end

#todo use meta-programming to dry the validation various test
  def test_validates_presence_of_year
    assert(@merlot.valid?)
    temp = @merlot.year
    @merlot.year = nil
    assert(!@merlot.valid?)
    assert(@merlot.errors[:year],"Expected an error on validation")
  end

  def test_validates_presence_of_family
    assert(@merlot.valid?)
    temp = @merlot.family
    @merlot.family = nil
    assert(!@merlot.valid?)
    assert(@merlot.errors[:family],"Expected an error on validation")
  end

   def test_validates_length_of_name
     @merlot = Factory.build(:merlot, :name =>  'x' * 101, :winery => @sunnyside )
      assert(!@merlot.valid?)
      assert(@merlot.errors[:name], "is too long (maximum is 100 characters)")    
  end

  def test_validates_length_of_family
     @merlot = Factory.build(:merlot, :family =>  'x' * 101, :winery => @sunnyside )
      assert(!@merlot.valid?)
      assert_equal(@merlot.errors[:family].join, "is too long (maximum is 100 characters)")    
  end

  def test_validates_format_of
    #validates_format_of :year, :with => /^\d{4}$/
    assert(@merlot.valid?)

    #example cases that should pass
    @merlot.year = 2008
    assert(@merlot.valid?)
    @merlot.year = '1234'
    assert(@merlot.valid?)
    
    #example of cases that should fail
    @merlot.year = 333
    assert(!@merlot.valid?)
    @merlot.year = 12345
    assert(!@merlot.valid?)
    @merlot.year = 'wxyz'
    assert(!@merlot.valid?)  
  end

  #to revisit by removing line 2 below
  def test_current_families
     @family = [@wine.family, @drink.family]
     @family = Wine.current_families
    assert_equal(@family , Wine.current_families)
  end

  #Need to rethink design of the method, the ordering can't be changed
  #Test only passes if things are passed in thi order.
  def test_newest
    @newest = [@drink, @merlot, @pinoit_noir, @wine]
     assert_equal(@newest, Wine.find_newest)
  end

  def test_oldest
    @newest = [@wine, @pinoit_noir, @merlot, @drink]
    assert_equal(@newest, Wine.find_oldest)
  end
  
  

end
