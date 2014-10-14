require 'test_helper'

class VenueDatesControllerTest < ActionController::TestCase
  setup do
    @venue_date = venue_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venue_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venue_date" do
    assert_difference('VenueDate.count') do
      post :create, venue_date: { date: @venue_date.date, service_id: @venue_date.service_id, vendor_id: @venue_date.vendor_id }
    end

    assert_redirected_to venue_date_path(assigns(:venue_date))
  end

  test "should show venue_date" do
    get :show, id: @venue_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @venue_date
    assert_response :success
  end

  test "should update venue_date" do
    patch :update, id: @venue_date, venue_date: { date: @venue_date.date, service_id: @venue_date.service_id, vendor_id: @venue_date.vendor_id }
    assert_redirected_to venue_date_path(assigns(:venue_date))
  end

  test "should destroy venue_date" do
    assert_difference('VenueDate.count', -1) do
      delete :destroy, id: @venue_date
    end

    assert_redirected_to venue_dates_path
  end
end
