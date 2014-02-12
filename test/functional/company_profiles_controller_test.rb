require 'test_helper'

class CompanyProfilesControllerTest < ActionController::TestCase
  setup do
    @company_profile = company_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_profile" do
    assert_difference('CompanyProfile.count') do
      post :create, company_profile: { company_establishment_date: @company_profile.company_establishment_date, company_name: @company_profile.company_name, hq_city: @company_profile.hq_city, hq_country: @company_profile.hq_country, hq_state: @company_profile.hq_state, hq_street_address: @company_profile.hq_street_address, hq_zipcode: @company_profile.hq_zipcode, super_admin_id: @company_profile.super_admin_id, website: @company_profile.website }
    end

    assert_redirected_to company_profile_path(assigns(:company_profile))
  end

  test "should show company_profile" do
    get :show, id: @company_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_profile
    assert_response :success
  end

  test "should update company_profile" do
    put :update, id: @company_profile, company_profile: { company_establishment_date: @company_profile.company_establishment_date, company_name: @company_profile.company_name, hq_city: @company_profile.hq_city, hq_country: @company_profile.hq_country, hq_state: @company_profile.hq_state, hq_street_address: @company_profile.hq_street_address, hq_zipcode: @company_profile.hq_zipcode, super_admin_id: @company_profile.super_admin_id, website: @company_profile.website }
    assert_redirected_to company_profile_path(assigns(:company_profile))
  end

  test "should destroy company_profile" do
    assert_difference('CompanyProfile.count', -1) do
      delete :destroy, id: @company_profile
    end

    assert_redirected_to company_profiles_path
  end
end
