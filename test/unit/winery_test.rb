require 'test_helper'

class WineryTest < ActiveSupport::TestCase
  
  def setup
    @sunnyside = Factory(:winery)
    @merlot = Factory(:merlot, :winery => @sunnyside)
    @pinoit_noir = Factory(:pinoit_noir, :winery => @sunnyside)
  end

  def teardown
    @sunnyside = nil
    @merlot = nil
    @pinoit_noir = nil
  end

  def test_has_many_relationships
   #has_many :wines
     assert_equal(2, @sunnyside.wines.count)
     assert_equal([1]*2, @sunnyside.wines.collect {|w| w.winery_id}) 
   
     assert_equal("Sunnyside Reserve", @sunnyside.wines.first.name)
     assert_equal("Valley Creek", @sunnyside.wines.last.name)

     #should sort by :order => 'name ASC' 
     for wine in @sunnyside.wines
       previous_name ||= ''
       assert(previous_name <= wine.name)
       previous_name = wine.name
     end
     
   end
end
