require 'test_helper'

class OneOffspringPicturesControllerTest < ActionController::TestCase
  setup do
    @one_offspring_picture = one_offspring_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:one_offspring_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create one_offspring_picture" do
    assert_difference('OneOffspringPicture.count') do
      post :create, one_offspring_picture: {  }
    end

    assert_redirected_to one_offspring_picture_path(assigns(:one_offspring_picture))
  end

  test "should show one_offspring_picture" do
    get :show, id: @one_offspring_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @one_offspring_picture
    assert_response :success
  end

  test "should update one_offspring_picture" do
    patch :update, id: @one_offspring_picture, one_offspring_picture: {  }
    assert_redirected_to one_offspring_picture_path(assigns(:one_offspring_picture))
  end

  test "should destroy one_offspring_picture" do
    assert_difference('OneOffspringPicture.count', -1) do
      delete :destroy, id: @one_offspring_picture
    end

    assert_redirected_to one_offspring_pictures_path
  end
end
