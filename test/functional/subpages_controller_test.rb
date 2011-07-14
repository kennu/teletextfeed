require 'test_helper'

class SubpagesControllerTest < ActionController::TestCase
  setup do
    @subpage = subpages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subpage" do
    assert_difference('Subpage.count') do
      post :create, :subpage => @subpage.attributes
    end

    assert_redirected_to subpage_path(assigns(:subpage))
  end

  test "should show subpage" do
    get :show, :id => @subpage.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @subpage.to_param
    assert_response :success
  end

  test "should update subpage" do
    put :update, :id => @subpage.to_param, :subpage => @subpage.attributes
    assert_redirected_to subpage_path(assigns(:subpage))
  end

  test "should destroy subpage" do
    assert_difference('Subpage.count', -1) do
      delete :destroy, :id => @subpage.to_param
    end

    assert_redirected_to subpages_path
  end
end
