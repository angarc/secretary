require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  context 'create new task' do
    before(:each) do
      @user = create(:user)
      sign_in @user
      visit new_dashboard_task_path
    end

    scenario 'should be successful' do
      within('#new_task') do
        fill_in 'Title', with: 'do HW 1'
        fill_in 'Deadline', with: DateTime.now + 3.days
        fill_in 'Duration', with: '02:30'
      end
      click_button 'Add'
      expect(page).to have_content 'Task was successfully created.'
    end
  end
end
