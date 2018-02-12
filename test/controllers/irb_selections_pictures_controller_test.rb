require 'test_helper'

class IrbSelectionsPicturesControllerTest < ActionController::TestCase
  setup do
    @irb_selections_picture = irb_selections_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:irb_selections_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create irb_selections_picture" do
    assert_difference('IrbSelectionsPicture.count') do
      post :create, irb_selections_picture: {  }
    end

    assert_redirected_to irb_selections_picture_path(assigns(:irb_selections_picture))
  end

  test "should show irb_selections_picture" do
    get :show, id: @irb_selections_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @irb_selections_picture
    assert_response :success
  end

  test "should update irb_selections_picture" do
    patch :update, id: @irb_selections_picture, irb_selections_picture: {  }
    assert_redirected_to irb_selections_picture_path(assigns(:irb_selections_picture))
  end

  test "should destroy irb_selections_picture" do
    assert_difference('IrbSelectionsPicture.count', -1) do
      delete :destroy, id: @irb_selections_picture
    end

    assert_redirected_to irb_selections_pictures_path
  end
end
