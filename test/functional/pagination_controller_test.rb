require 'test/test_helper'
require 'mocha'

## http://mislav.uniqpath.com/rails/will_paginate-view-testing/

class PaginationControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "should get index" do
    PaginationItem.expects(:paginate).with(:page => "2", 
                                           :per_page => 5, 
                                           :order => :name, 
                                           :conditions => [ 'name like ?', "%%" ]).returns([].paginate)

    get :index, :page => 2
    assert_response :success
    assert assigns(:pagination_items)
  end
  
  test "should get index with data" do
    data = (1..15).map { PaginationItem.new }
    PaginationItem.expects(:paginate).with(:page => "2", 
                                           :per_page => 5, 
                                           :order => :name, 
                                           :conditions => [ 'name like ?', "%%" ]).returns(data.paginate)
    
    get :index, :page => 2
    assert_response :success
    assert assigns(:pagination_items)
    assert_select 'pagination'
  end
  
end
