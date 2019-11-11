require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "User management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
 
    # Task.create!(title: 'Student', content: 'Is a good student')
    # Task.create!(title: 'Accountant', content: 'Balance money')
    background do
      User.create!(name: "shema", email: 'shema@gmail.com',  password: 'prince')
      visit  root_path
      fill_in  'Email' ,  with: 'shema@gmail.com'
      fill_in  'Password' ,  with: 'prince'
      click_on  'Log in'
    end
    scenario "Test the number of users" do
      User.create!(name: 'shamil', email: 'shamil.com', admin: 'true', password: 'prince')
      @user = User.all.count
      expect(@user).to eq 2
    end    
    scenario "Test user list" do
      user=User.all
      assert user       
    end
    scenario "Test user creation" do
      User.create!(name: 'Shema', email: 'shemab@gmail.com', admin: 'true', password: 'prince')
      visit users_path
      expect(page ).to  have_content  'Shema'
    end
    scenario "test enable user creation page" do
      User.create!(name: 'Shema', email: 'shemab@gmail.com', admin: 'true', password: 'prince')
      visit admin_users_path
      expect(page ).to  have_content  'To go to this page, you must sign in as an admin'
    end
    scenario "Test details of the user" do
      @user= User.create!(name: 'Mimi', email: 'mimi@gmail.com', admin: 'true', password: '1234567')
      visit admin_users_path
      expect(page).to have_content('To go to this page, you must sign in as an admin')
    end
    scenario 'Test to delete the user' do
      User.create!(name: 'cherif', email: 'cherif@gmail.com', admin: 'true', password: 'prince')
      @user = User.last
      @user.destroy
      visit users_path
      expect(page).not_to have_content('cherif')
    end
    scenario "User creation by Admin" do
       visit new_admin_user_path
       User.create!(name: 'Kaka', email: 'kaka@gmail.com', admin: 'true', password: 'prince')
       visit  admin_users_url
       expect(page).to have_text('you must sign in as an admin')
    end
end



