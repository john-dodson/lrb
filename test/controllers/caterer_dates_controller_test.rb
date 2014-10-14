require 'test_helper'

class CatererDatesControllerTest < ActionController::TestCase
  setup do
    @caterer_date = caterer_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caterer_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caterer_date" do
    assert_difference('CatererDate.count') do
      post :create, caterer_date: { caterer_id: @caterer_date.caterer_id, date: @caterer_date.date, service_id: @caterer_date.service_id }
    end

    assert_redirected_to caterer_date_path(assigns(:caterer_date))
  end

  test "should show caterer_date" do
    get :show, id: @caterer_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caterer_date
    assert_response :success
  end

  test "should update caterer_date" do
    patch :update, id: @caterer_date, caterer_date: { caterer_id: @caterer_date.caterer_id, date: @caterer_date.date, service_id: @caterer_date.service_id }
    assert_redirected_to caterer_date_path(assigns(:caterer_date))
  end

  test "should destroy caterer_date" do
    assert_difference('CatererDate.count', -1) do
      delete :destroy, id: @caterer_date
    end

    assert_redirected_to caterer_dates_path
  end
end
