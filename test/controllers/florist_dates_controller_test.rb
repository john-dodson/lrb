require 'test_helper'

class FloristDatesControllerTest < ActionController::TestCase
  setup do
    @florist_date = florist_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:florist_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create florist_date" do
    assert_difference('FloristDate.count') do
      post :create, florist_date: { date: @florist_date.date, florist_id: @florist_date.florist_id, service_id: @florist_date.service_id }
    end

    assert_redirected_to florist_date_path(assigns(:florist_date))
  end

  test "should show florist_date" do
    get :show, id: @florist_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @florist_date
    assert_response :success
  end

  test "should update florist_date" do
    patch :update, id: @florist_date, florist_date: { date: @florist_date.date, florist_id: @florist_date.florist_id, service_id: @florist_date.service_id }
    assert_redirected_to florist_date_path(assigns(:florist_date))
  end

  test "should destroy florist_date" do
    assert_difference('FloristDate.count', -1) do
      delete :destroy, id: @florist_date
    end

    assert_redirected_to florist_dates_path
  end
end
