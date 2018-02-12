require 'test_helper'

class TwoOffspringPicturesControllerTest < ActionController::TestCase
  setup do
    @two_offspring_picture = two_offspring_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:two_offspring_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create two_offspring_picture" do
    assert_difference('TwoOffspringPicture.count') do
      post :create, two_offspring_picture: {  }
    end

    assert_redirected_to two_offspring_picture_path(assigns(:two_offspring_picture))
  end

  test "should show two_offspring_picture" do
    get :show, id: @two_offspring_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @two_offspring_picture
    assert_response :success
  end

  test "should update two_offspring_picture" do
    patch :update, id: @two_offspring_picture, two_offspring_picture: {  }
    assert_redirected_to two_offspring_picture_path(assigns(:two_offspring_picture))
  end

  test "should destroy two_offspring_picture" do
    assert_difference('TwoOffspringPicture.count', -1) do
      delete :destroy, id: @two_offspring_picture
    end

    assert_redirected_to two_offspring_pictures_path
  end
end
