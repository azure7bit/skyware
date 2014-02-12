require 'test_helper'

class BusinessMessengersControllerTest < ActionController::TestCase
  setup do
    @business_messenger = business_messengers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_messengers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_messenger" do
    assert_difference('BusinessMessenger.count') do
      post :create, business_messenger: { body: @business_messenger.body, email: @business_messenger.email, super_admin_id: @business_messenger.super_admin_id }
    end

    assert_redirected_to business_messenger_path(assigns(:business_messenger))
  end

  test "should show business_messenger" do
    get :show, id: @business_messenger
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_messenger
    assert_response :success
  end

  test "should update business_messenger" do
    put :update, id: @business_messenger, business_messenger: { body: @business_messenger.body, email: @business_messenger.email, super_admin_id: @business_messenger.super_admin_id }
    assert_redirected_to business_messenger_path(assigns(:business_messenger))
  end

  test "should destroy business_messenger" do
    assert_difference('BusinessMessenger.count', -1) do
      delete :destroy, id: @business_messenger
    end

    assert_redirected_to business_messengers_path
  end
end
