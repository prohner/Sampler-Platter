class GroceryList < ActiveRecord::Base
  has_many :food_items, :order => 'position'
end
