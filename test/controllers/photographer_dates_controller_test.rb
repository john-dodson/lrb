require 'test_helper'

class PhotographerDatesControllerTest < ActionController::TestCase
  setup do
    @photographer_date = photographer_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photographer_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photographer_date" do
    assert_difference('PhotographerDate.count') do
      post :create, photographer_date: { date: @photographer_date.date, photographer_id: @photographer_date.photographer_id, service_id: @photographer_date.service_id }
    end

    assert_redirected_to photographer_date_path(assigns(:photographer_date))
  end

  test "should show photographer_date" do
    get :show, id: @photographer_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photographer_date
    assert_response :success
  end

  test "should update photographer_date" do
    patch :update, id: @photographer_date, photographer_date: { date: @photographer_date.date, photographer_id: @photographer_date.photographer_id, service_id: @photographer_date.service_id }
    assert_redirected_to photographer_date_path(assigns(:photographer_date))
  end

  test "should destroy photographer_date" do
    assert_difference('PhotographerDate.count', -1) do
      delete :destroy, id: @photographer_date
    end

    assert_redirected_to photographer_dates_path
  end
end
