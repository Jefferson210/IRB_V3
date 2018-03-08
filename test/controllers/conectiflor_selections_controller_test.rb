require 'test_helper'

class ConectiflorSelectionsControllerTest < ActionController::TestCase
  setup do
    @conectiflor_selection = conectiflor_selections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conectiflor_selections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conectiflor_selection" do
    assert_difference('ConectiflorSelection.count') do
      post :create, conectiflor_selection: {  }
    end

    assert_redirected_to conectiflor_selection_path(assigns(:conectiflor_selection))
  end

  test "should show conectiflor_selection" do
    get :show, id: @conectiflor_selection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conectiflor_selection
    assert_response :success
  end

  test "should update conectiflor_selection" do
    patch :update, id: @conectiflor_selection, conectiflor_selection: {  }
    assert_redirected_to conectiflor_selection_path(assigns(:conectiflor_selection))
  end

  test "should destroy conectiflor_selection" do
    assert_difference('ConectiflorSelection.count', -1) do
      delete :destroy, id: @conectiflor_selection
    end

    assert_redirected_to conectiflor_selections_path
  end
end
