require 'test_helper'

class SpekSelectionsPicturesControllerTest < ActionController::TestCase
  setup do
    @spek_selections_picture = spek_selections_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spek_selections_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spek_selections_picture" do
    assert_difference('SpekSelectionsPicture.count') do
      post :create, spek_selections_picture: {  }
    end

    assert_redirected_to spek_selections_picture_path(assigns(:spek_selections_picture))
  end

  test "should show spek_selections_picture" do
    get :show, id: @spek_selections_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spek_selections_picture
    assert_response :success
  end

  test "should update spek_selections_picture" do
    patch :update, id: @spek_selections_picture, spek_selections_picture: {  }
    assert_redirected_to spek_selections_picture_path(assigns(:spek_selections_picture))
  end

  test "should destroy spek_selections_picture" do
    assert_difference('SpekSelectionsPicture.count', -1) do
      delete :destroy, id: @spek_selections_picture
    end

    assert_redirected_to spek_selections_pictures_path
  end
end
