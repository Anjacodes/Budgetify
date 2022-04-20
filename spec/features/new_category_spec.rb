require_relative '../rails_helper'

RSpec.describe 'The new category page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Test User', email: 'test@testmail.com', password: '123456')

      visit 'users/sign_in'
      fill_in 'Email', with: 'test@testmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'

      @path = "/categories/new"
    end

    it 'has a form that allows to add new categories' do
      visit @path
      expect(page).to have_content 'NEW CATEGORY'
    end

    it 'shows an error when submit button is clicked and no name and icon have been entered' do
      visit @path
      click_on 'Create Category'
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Icon can't be blank"
    end

    it 'shows a success message and takes you back to home when clicking on Create Category button' do
      visit @path
      fill_in 'Name', with: 'Test Category'
      fill_in 'Icon', with: 'www.testicon.com'
      click_on 'Create Category'
      expect(page).to have_content 'Category was successfully created'
      expect(current_path).to eql "/"
    end

    it 'takes you back to home page when clicking on back to categories' do
      visit @path
      find(:xpath, "/html/body/header/a").click
      expect(current_path).to eql "/"
    end
  end
end
