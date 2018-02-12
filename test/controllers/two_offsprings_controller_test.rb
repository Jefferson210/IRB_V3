require 'test_helper'

class TwoOffspringsControllerTest < ActionController::TestCase
  setup do
    @two_offspring = two_offsprings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:two_offsprings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create two_offspring" do
    assert_difference('TwoOffspring.count') do
      post :create, two_offspring: {  }
    end

    assert_redirected_to two_offspring_path(assigns(:two_offspring))
  end

  test "should show two_offspring" do
    get :show, id: @two_offspring
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @two_offspring
    assert_response :success
  end

  test "should update two_offspring" do
    patch :update, id: @two_offspring, two_offspring: {  }
    assert_redirected_to two_offspring_path(assigns(:two_offspring))
  end

  test "should destroy two_offspring" do
    assert_difference('TwoOffspring.count', -1) do
      delete :destroy, id: @two_offspring
    end

    assert_redirected_to two_offsprings_path
  end
end
