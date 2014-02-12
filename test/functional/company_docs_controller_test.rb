require 'test_helper'

class CompanyDocsControllerTest < ActionController::TestCase
  setup do
    @company_doc = company_docs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_docs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_doc" do
    assert_difference('CompanyDoc.count') do
      post :create, company_doc: {  }
    end

    assert_redirected_to company_doc_path(assigns(:company_doc))
  end

  test "should show company_doc" do
    get :show, id: @company_doc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_doc
    assert_response :success
  end

  test "should update company_doc" do
    put :update, id: @company_doc, company_doc: {  }
    assert_redirected_to company_doc_path(assigns(:company_doc))
  end

  test "should destroy company_doc" do
    assert_difference('CompanyDoc.count', -1) do
      delete :destroy, id: @company_doc
    end

    assert_redirected_to company_docs_path
  end
end
