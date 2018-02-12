require 'test_helper'

class OneOffspringsControllerTest < ActionController::TestCase
  setup do
    @one_offspring = one_offsprings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:one_offsprings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create one_offspring" do
    assert_difference('OneOffspring.count') do
      post :create, one_offspring: {  }
    end

    assert_redirected_to one_offspring_path(assigns(:one_offspring))
  end

  test "should show one_offspring" do
    get :show, id: @one_offspring
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @one_offspring
    assert_response :success
  end

  test "should update one_offspring" do
    patch :update, id: @one_offspring, one_offspring: {  }
    assert_redirected_to one_offspring_path(assigns(:one_offspring))
  end

  test "should destroy one_offspring" do
    assert_difference('OneOffspring.count', -1) do
      delete :destroy, id: @one_offspring
    end

    assert_redirected_to one_offsprings_path
  end
end
