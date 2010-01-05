class FoodItem < ActiveRecord::Base
  ## http://harryche2008.wordpress.com/2008/07/19/how-to-do-ajax-style-drag-n-drop-sorting-with-rails/
  
  belongs_to :grocery_list
  acts_as_list :scope => :grocery_list
end
