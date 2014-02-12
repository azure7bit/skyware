require 'test_helper'

class CompanyForumTopicsControllerTest < ActionController::TestCase
  setup do
    @company_forum_topic = company_forum_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_forum_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_forum_topic" do
    assert_difference('CompanyForumTopic.count') do
      post :create, company_forum_topic: {  }
    end

    assert_redirected_to company_forum_topic_path(assigns(:company_forum_topic))
  end

  test "should show company_forum_topic" do
    get :show, id: @company_forum_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_forum_topic
    assert_response :success
  end

  test "should update company_forum_topic" do
    put :update, id: @company_forum_topic, company_forum_topic: {  }
    assert_redirected_to company_forum_topic_path(assigns(:company_forum_topic))
  end

  test "should destroy company_forum_topic" do
    assert_difference('CompanyForumTopic.count', -1) do
      delete :destroy, id: @company_forum_topic
    end

    assert_redirected_to company_forum_topics_path
  end
end
