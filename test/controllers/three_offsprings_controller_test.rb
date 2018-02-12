require 'test_helper'

class ThreeOffspringsControllerTest < ActionController::TestCase
  setup do
    @three_offspring = three_offsprings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:three_offsprings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create three_offspring" do
    assert_difference('ThreeOffspring.count') do
      post :create, three_offspring: {  }
    end

    assert_redirected_to three_offspring_path(assigns(:three_offspring))
  end

  test "should show three_offspring" do
    get :show, id: @three_offspring
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @three_offspring
    assert_response :success
  end

  test "should update three_offspring" do
    patch :update, id: @three_offspring, three_offspring: {  }
    assert_redirected_to three_offspring_path(assigns(:three_offspring))
  end

  test "should destroy three_offspring" do
    assert_difference('ThreeOffspring.count', -1) do
      delete :destroy, id: @three_offspring
    end

    assert_redirected_to three_offsprings_path
  end
end
