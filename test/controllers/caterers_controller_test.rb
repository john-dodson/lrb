require 'test_helper'

class CaterersControllerTest < ActionController::TestCase
  setup do
    @caterer = caterers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caterers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caterer" do
    assert_difference('Caterer.count') do
      post :create, caterer: { name: @caterer.name }
    end

    assert_redirected_to caterer_path(assigns(:caterer))
  end

  test "should show caterer" do
    get :show, id: @caterer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caterer
    assert_response :success
  end

  test "should update caterer" do
    patch :update, id: @caterer, caterer: { name: @caterer.name }
    assert_redirected_to caterer_path(assigns(:caterer))
  end

  test "should destroy caterer" do
    assert_difference('Caterer.count', -1) do
      delete :destroy, id: @caterer
    end

    assert_redirected_to caterers_path
  end
end
