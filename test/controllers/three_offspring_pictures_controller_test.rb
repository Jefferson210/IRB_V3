require 'test_helper'

class ThreeOffspringPicturesControllerTest < ActionController::TestCase
  setup do
    @three_offspring_picture = three_offspring_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:three_offspring_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create three_offspring_picture" do
    assert_difference('ThreeOffspringPicture.count') do
      post :create, three_offspring_picture: {  }
    end

    assert_redirected_to three_offspring_picture_path(assigns(:three_offspring_picture))
  end

  test "should show three_offspring_picture" do
    get :show, id: @three_offspring_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @three_offspring_picture
    assert_response :success
  end

  test "should update three_offspring_picture" do
    patch :update, id: @three_offspring_picture, three_offspring_picture: {  }
    assert_redirected_to three_offspring_picture_path(assigns(:three_offspring_picture))
  end

  test "should destroy three_offspring_picture" do
    assert_difference('ThreeOffspringPicture.count', -1) do
      delete :destroy, id: @three_offspring_picture
    end

    assert_redirected_to three_offspring_pictures_path
  end
end
