require 'test_helper'

class GerminationsControllerTest < ActionController::TestCase
  setup do
    @germination = germinations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:germinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create germination" do
    assert_difference('Germination.count') do
      post :create, germination: {  }
    end

    assert_redirected_to germination_path(assigns(:germination))
  end

  test "should show germination" do
    get :show, id: @germination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @germination
    assert_response :success
  end

  test "should update germination" do
    patch :update, id: @germination, germination: {  }
    assert_redirected_to germination_path(assigns(:germination))
  end

  test "should destroy germination" do
    assert_difference('Germination.count', -1) do
      delete :destroy, id: @germination
    end

    assert_redirected_to germinations_path
  end
end
