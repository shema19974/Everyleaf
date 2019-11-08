# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Label Management function", type: :feature do
 # In scenario (alias of it), write the processing of the test for each item you want to check.
 background do
   User.create!(name: "shema", email: 'shema@gmail.Com', admin: 'true',  password: 'prince')
   visit  root_path

   fill_in  'Email' ,  with: 'shema@gmail.Com'
   fill_in  'Password' ,  with: 'prince'
   click_on  'Log in'

 end


 scenario "create a label" do
    @user = User.first
    @label = Label.create!(title: "Label 1",user_id: @user.id)
    visit labels_path
    expect(page).to have_content('Label 1')
  end

 scenario "can search by attached labels " do
    visit new_label_path
    @user = User.first
    @label = Label.create!(title: "my label",user_id: @user.id)
    visit new_label_path
    @user = User.first
    @label = Label.create!(title: "label 1",user_id: @user.id)
    @user=User.first
    @task = Task.create!(title: "Test", content: 'test2',status: 'In progress',user_id: @user.id)
     @label = Label.first
     @label1 = Label.last
     @task.labels = [@label,@label1]
     @task.save
    visit tasks_path
    fill_in  'search' ,  with: 'my label'
    click_on 'search'
    expect(page).to have_content('In progress')
  end
end