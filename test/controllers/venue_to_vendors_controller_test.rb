require 'test_helper'

class VenueToVendorsControllerTest < ActionController::TestCase
  setup do
    @venue_to_vendor = venue_to_vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venue_to_vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venue_to_vendor" do
    assert_difference('VenueToVendor.count') do
      post :create, venue_to_vendor: { vendor_id: @venue_to_vendor.vendor_id, vendor_type_id: @venue_to_vendor.vendor_type_id, venue_id: @venue_to_vendor.venue_id }
    end

    assert_redirected_to venue_to_vendor_path(assigns(:venue_to_vendor))
  end

  test "should show venue_to_vendor" do
    get :show, id: @venue_to_vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @venue_to_vendor
    assert_response :success
  end

  test "should update venue_to_vendor" do
    patch :update, id: @venue_to_vendor, venue_to_vendor: { vendor_id: @venue_to_vendor.vendor_id, vendor_type_id: @venue_to_vendor.vendor_type_id, venue_id: @venue_to_vendor.venue_id }
    assert_redirected_to venue_to_vendor_path(assigns(:venue_to_vendor))
  end

  test "should destroy venue_to_vendor" do
    assert_difference('VenueToVendor.count', -1) do
      delete :destroy, id: @venue_to_vendor
    end

    assert_redirected_to venue_to_vendors_path
  end
end
