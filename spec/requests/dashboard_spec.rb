require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  describe "GET /index" do
    context 'when logged in' do
      it "is expected to respond with status code 200" do
        @user = create(:user)
        sign_in @user
        get dashboard_path
        expect(response).to have_http_status(200)
      end
    end

    context 'when not logged in' do
      it "is expected to respond with a redirect to the login page" do
        get dashboard_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
