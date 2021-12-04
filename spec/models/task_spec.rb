require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:each) do
    @user = create(:user)
    @task = build(:task, user: @user)
  end

  it "is valid with all necessary attributes" do
    expect(@task).to be_valid
  end

  it "is not valid without a name" do
    @task.name = ""
    expect(@task).to_not be_valid
  end

  it "is not valid without a duration_hours" do
    @task.duration_hours = nil
    expect(@task).to_not be_valid
  end

  it "is not valid without a duration_minutes" do
    @task.duration_minutes = nil
    expect(@task).to_not be_valid
  end

  it "is not valid without a deadline" do
    @task.deadline = nil
    expect(@task).to_not be_valid
  end

  it "is not valid with a negative duration_hours" do
    @task.duration_hours = -1
    expect(@task).to_not be_valid
  end

  it "is not valid with a negative duration_minutes" do
    @task.duration_minutes = -1
    expect(@task).to_not be_valid
  end

  it "is not valid with a duration_minutes greater than 59" do
    @task.duration_minutes = 60
    expect(@task).to_not be_valid
  end

  it "is not valid with a duration_minutes and duration_hours both set to 0" do
    @task.duration_minutes = 0
    @task.duration_hours = 0
    expect(@task).to_not be_valid
  end

  it "is not valid without a user" do
    @task.user = nil
    expect(@task).to_not be_valid
  end
end
