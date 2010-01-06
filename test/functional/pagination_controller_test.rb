require 'test/test_helper'
require 'mocha'

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
end
