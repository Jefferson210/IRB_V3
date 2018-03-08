require 'test_helper'

class ConectiflorPicturesControllerTest < ActionController::TestCase
  setup do
    @conectiflor_picture = conectiflor_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conectiflor_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conectiflor_picture" do
    assert_difference('ConectiflorPicture.count') do
      post :create, conectiflor_picture: {  }
    end

    assert_redirected_to conectiflor_picture_path(assigns(:conectiflor_picture))
  end

  test "should show conectiflor_picture" do
    get :show, id: @conectiflor_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conectiflor_picture
    assert_response :success
  end

  test "should update conectiflor_picture" do
    patch :update, id: @conectiflor_picture, conectiflor_picture: {  }
    assert_redirected_to conectiflor_picture_path(assigns(:conectiflor_picture))
  end

  test "should destroy conectiflor_picture" do
    assert_difference('ConectiflorPicture.count', -1) do
      delete :destroy, id: @conectiflor_picture
    end

    assert_redirected_to conectiflor_pictures_path
  end
end
