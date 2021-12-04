require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  context 'create new task' do
    before(:each) do
      visit dashboard_path
    end

    scenario 'should be successful' do
      
    end
  end
end
