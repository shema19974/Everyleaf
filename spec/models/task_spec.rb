require 'rails_helper'

RSpec.describe Task, type: :model do

  it "Validation does not pass if the title is empty" do
    task = Task.new(title: '', content: 'Failure test')
    expect(task).not_to be_valid
  end

  it "Validation does not pass if content is empty" do
    task = Task.new(title: 'Student', content: '')
    expect(task).not_to be_valid
  end

  it "validation passes If content is described in title and content" do
    @user= User.create!(name: "shema", email: 'shema@gmail.com',  password: 'prince')
    task = Task.new(title: 'Student', content: 'passed the test test', start_date: '2019-10-10', end_date: '2019-10-10',user_id: @user.id)
    expect(task).to be_valid
  end
end