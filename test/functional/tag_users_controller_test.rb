require 'test_helper'

class TagUsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_user" do
    assert_difference('TagUser.count') do
      post :create, :tag_user => { }
    end

    assert_redirected_to tag_user_path(assigns(:tag_user))
  end

  test "should show tag_user" do
    get :show, :id => tag_users(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tag_users(:one).to_param
    assert_response :success
  end

  test "should update tag_user" do
    put :update, :id => tag_users(:one).to_param, :tag_user => { }
    assert_redirected_to tag_user_path(assigns(:tag_user))
  end

  test "should destroy tag_user" do
    assert_difference('TagUser.count', -1) do
      delete :destroy, :id => tag_users(:one).to_param
    end

    assert_redirected_to tag_users_path
  end
end
