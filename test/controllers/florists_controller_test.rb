require 'test_helper'

class FloristsControllerTest < ActionController::TestCase
  setup do
    @florist = florists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:florists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create florist" do
    assert_difference('Florist.count') do
      post :create, florist: { name: @florist.name }
    end

    assert_redirected_to florist_path(assigns(:florist))
  end

  test "should show florist" do
    get :show, id: @florist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @florist
    assert_response :success
  end

  test "should update florist" do
    patch :update, id: @florist, florist: { name: @florist.name }
    assert_redirected_to florist_path(assigns(:florist))
  end

  test "should destroy florist" do
    assert_difference('Florist.count', -1) do
      delete :destroy, id: @florist
    end

    assert_redirected_to florists_path
  end
end
