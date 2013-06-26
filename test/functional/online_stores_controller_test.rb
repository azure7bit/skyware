require 'test_helper'

class OnlineStoresControllerTest < ActionController::TestCase
  setup do
    @online_store = online_stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:online_stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create online_store" do
    assert_difference('OnlineStore.count') do
      post :create, online_store: { super_admin_id: @online_store.super_admin_id }
    end

    assert_redirected_to online_store_path(assigns(:online_store))
  end

  test "should show online_store" do
    get :show, id: @online_store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @online_store
    assert_response :success
  end

  test "should update online_store" do
    put :update, id: @online_store, online_store: { super_admin_id: @online_store.super_admin_id }
    assert_redirected_to online_store_path(assigns(:online_store))
  end

  test "should destroy online_store" do
    assert_difference('OnlineStore.count', -1) do
      delete :destroy, id: @online_store
    end

    assert_redirected_to online_stores_path
  end
end
