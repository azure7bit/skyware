require 'test_helper'

class CompanyForumsControllerTest < ActionController::TestCase
  setup do
    @company_forum = company_forums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_forums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_forum" do
    assert_difference('CompanyForum.count') do
      post :create, company_forum: {  }
    end

    assert_redirected_to company_forum_path(assigns(:company_forum))
  end

  test "should show company_forum" do
    get :show, id: @company_forum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_forum
    assert_response :success
  end

  test "should update company_forum" do
    put :update, id: @company_forum, company_forum: {  }
    assert_redirected_to company_forum_path(assigns(:company_forum))
  end

  test "should destroy company_forum" do
    assert_difference('CompanyForum.count', -1) do
      delete :destroy, id: @company_forum
    end

    assert_redirected_to company_forums_path
  end
end
