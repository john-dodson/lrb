require 'test_helper'

class ServiceToVendorsControllerTest < ActionController::TestCase
  setup do
    @service_to_vendor = service_to_vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_to_vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_to_vendor" do
    assert_difference('ServiceToVendor.count') do
      post :create, service_to_vendor: { service_id: @service_to_vendor.service_id, vendor_id: @service_to_vendor.vendor_id, vendor_type_id: @service_to_vendor.vendor_type_id }
    end

    assert_redirected_to service_to_vendor_path(assigns(:service_to_vendor))
  end

  test "should show service_to_vendor" do
    get :show, id: @service_to_vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_to_vendor
    assert_response :success
  end

  test "should update service_to_vendor" do
    patch :update, id: @service_to_vendor, service_to_vendor: { service_id: @service_to_vendor.service_id, vendor_id: @service_to_vendor.vendor_id, vendor_type_id: @service_to_vendor.vendor_type_id }
    assert_redirected_to service_to_vendor_path(assigns(:service_to_vendor))
  end

  test "should destroy service_to_vendor" do
    assert_difference('ServiceToVendor.count', -1) do
      delete :destroy, id: @service_to_vendor
    end

    assert_redirected_to service_to_vendors_path
  end
end
