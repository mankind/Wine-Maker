FactoryGirl.define do
  factory :winery do 
    name 'Sunnyside Vineyards'
    city 'Sonoma'
    state 'CA'
    country 'USA'
  end
end

FactoryGirl.define do
  
  sequence(:name) {|n| "name#{n}"}
  sequence(:year) {|n| "year#{n}"}
  sequence(:family) {|n| "family#{n}"}
  sequence(:created_at) {|n| "created_at#{n}"}
  sequence(:updated_at) {|n| "updated_at#{n}"}

  factory :wine do 
    name { Factory.next(:name)}
    year {Factory.next(:year) }
    family { Factory.next(:family) }
    created_at {Factory.next(:created_at) }
    updated_at {Factory.next(:updated_at) }
  
    association :winery

  factory :merlot, :parent => :wine do
    name  {'Sunnyside Reserve'}
    year  {2003}
    family {'Merlot'}
    created_at {1.week.ago.to_s(:db)}
    updated_at  {1.week.ago.to_s(:db)}
  end

  factory :pinoit_noir, :parent => :wine do
    name  {'Valley Creek'}
    year  {1998}
    family {'Pinoit Noir'}
    created_at {Time.now.to_s(:db)}
    updated_at  {Time.now.to_s(:db)}
  end

   end
end
  

    

    





