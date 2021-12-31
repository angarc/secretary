require 'rails_helper'

RSpec.describe "Dashboard::Tasks", type: :request do
  context 'when logged in' do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end

    describe "GET /index" do
      it "should respond with status code 200" do
        get dashboard_tasks_path
        expect(response).to have_http_status(200)
      end
    end
  end

  context 'when not logged in' do
    describe "GET /index" do
      it "should redirect to login page" do
        get dashboard_tasks_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
