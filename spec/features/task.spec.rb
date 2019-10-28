require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  background do
    # Task.create!(title: 'Student', content: 'Is a good student')
    # Task.create!(title: 'Accountant', content: 'Balance money')
    User.create!(name: "shema", email: 'shema@gmail.com',  password: 'prince')
    visit  root_path
    fill_in  'Email' ,  with: 'shema@gmail.com'
    fill_in  'Password' ,  with: 'prince'
    click_on  'Log in'    
  end

  scenario "Test task list" do    

    visit new_task_path

    @user=User.first
  Task.create!(title: "test", content: "content1", user_id: @user.id)
  Task.create!(title: "test2", content: "content2",user_id: @user.id)
    visit tasks_path
    expect(page).to have_content 'test'
    expect(page).to have_content 'test2'
  end

  scenario "Test task creation" do
    @user=User.first
    
    Task.create!(title: "test2", content: "content2",user_id: @user.id)
      visit tasks_path
      
      expect(page).to have_content 'test2'  
  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    visit tasks_path
    assert Task.order('created_at DESC')    
  end  

  scenario "Test whether tasks are arranged in descending order of deadline" do
    visit tasks_path
    assert Task.order('end_date DESC') 
  end




  scenario "Test whether tasks are arranged in descending order of priority" do
    visit tasks_path
    assert Task.order('priority DESC')
  end

  scenario "test the search by title" do
    @user=User.first
    Task.create!(title: "test", content: "content1", user_id: @user.id)
    visit tasks_path
    fill_in 'Enter a title or status you want to search: ', with: 'test'
    click_button 'Search'
    expect(page).to have_content 'test'
  end

  scenario "test the search by status" do
    @user=User.first
    Task.create!(title: "test", content: "content2", user_id: @user.id)
    visit tasks_path
    fill_in 'Enter a title or status you want to search: ', with: 'test'
    click_button 'Search'
    expect(page).to have_content 'Not started'
  end
  
  scenario "test the search by title and by status" do
    @user=User.first
    Task.create!(title: "test", content: "content2", user_id: @user.id)
    visit tasks_path
    fill_in 'Enter a title or status you want to search: ', with: 'test'
    click_button 'Search'
    expect(page).to have_content 'test'
    expect(page).to have_content 'Not started'
  end

end


