require 'spec_helper'

describe LocationsController do
	context 'super admin not logged in' do
		describe "index" do
			it "should redirect to sign in page" do
				get :index
				expect(response).to redirect_to(new_super_admin_session_path)
				expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
			end
		end
	end
	context "Super admin logged_in" do
		let(:super_admin) { sign_in_super_admin; @super_admin }
		describe "index" do
			it "should list all the locations created by current super admin" do
				location1 = create(:location, super_admin: super_admin)
				location2 = create(:location, super_admin: super_admin)
				get :index
				expect(assigns(:locations)).to include(location1, location2)
				expect(assigns(:locations).count).to eq(2)
			end
		end
	end
end
