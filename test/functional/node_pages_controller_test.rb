require 'test_helper'

class NodePagesControllerTest < ActionController::TestCase
  setup do
    @node_page = node_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:node_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create node_page" do
    assert_difference('NodePage.count') do
      post :create, node_page: {  }
    end

    assert_redirected_to node_page_path(assigns(:node_page))
  end

  test "should show node_page" do
    get :show, id: @node_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @node_page
    assert_response :success
  end

  test "should update node_page" do
    put :update, id: @node_page, node_page: {  }
    assert_redirected_to node_page_path(assigns(:node_page))
  end

  test "should destroy node_page" do
    assert_difference('NodePage.count', -1) do
      delete :destroy, id: @node_page
    end

    assert_redirected_to node_pages_path
  end
end
