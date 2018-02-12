require 'test_helper'

class GeneticBankPicturesControllerTest < ActionController::TestCase
  setup do
    @genetic_bank_picture = genetic_bank_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:genetic_bank_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create genetic_bank_picture" do
    assert_difference('GeneticBankPicture.count') do
      post :create, genetic_bank_picture: {  }
    end

    assert_redirected_to genetic_bank_picture_path(assigns(:genetic_bank_picture))
  end

  test "should show genetic_bank_picture" do
    get :show, id: @genetic_bank_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @genetic_bank_picture
    assert_response :success
  end

  test "should update genetic_bank_picture" do
    patch :update, id: @genetic_bank_picture, genetic_bank_picture: {  }
    assert_redirected_to genetic_bank_picture_path(assigns(:genetic_bank_picture))
  end

  test "should destroy genetic_bank_picture" do
    assert_difference('GeneticBankPicture.count', -1) do
      delete :destroy, id: @genetic_bank_picture
    end

    assert_redirected_to genetic_bank_pictures_path
  end
end
