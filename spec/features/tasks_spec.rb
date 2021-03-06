require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  context 'on create' do
    before(:each) do
      @user = create(:user)
      sign_in @user
      visit dashboard_tasks_path
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

  context 'on update' do
    before(:each) do 
      @user = create(:user)
      sign_in @user
      @task = create(:task, user: @user)
    end

    @javascript
    scenario 'should be successful' do
      visit dashboard_tasks_path
      find("#task-#{@task.id}-edit-btn").click
      expect(page).to have_content 'Task was successfully updated.'
    end
  end
end
