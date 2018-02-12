require 'test_helper'

class IrbSelectionsControllerTest < ActionController::TestCase
  setup do
    @irb_selection = irb_selections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:irb_selections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create irb_selection" do
    assert_difference('IrbSelection.count') do
      post :create, irb_selection: {  }
    end

    assert_redirected_to irb_selection_path(assigns(:irb_selection))
  end

  test "should show irb_selection" do
    get :show, id: @irb_selection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @irb_selection
    assert_response :success
  end

  test "should update irb_selection" do
    patch :update, id: @irb_selection, irb_selection: {  }
    assert_redirected_to irb_selection_path(assigns(:irb_selection))
  end

  test "should destroy irb_selection" do
    assert_difference('IrbSelection.count', -1) do
      delete :destroy, id: @irb_selection
    end

    assert_redirected_to irb_selections_path
  end
end
