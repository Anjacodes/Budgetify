require_relative '../rails_helper'

RSpec.describe 'The new expense page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Test User', email: 'test@testmail.com', password: '123456')

      @category1 = Category.create!(name: 'Test Category 1', icon: 'wwww.testicon.com', user_id: @user1.id)

      @category2 = Category.create!(name: 'Test Category 2', icon: 'wwww.testicon.com', user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'test@testmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'

      @path = "/categories/#{@category1.id}/expenses/new"
    end

    it 'shows all the different categories to choose from' do
      visit @path
      expect(page).to have_content 'Test Category 1'
      expect(page).to have_content 'Test Category 2'
    end

    it 'shows an error when submit button is clicked and no name and amount have been entered' do
      visit @path
      click_on 'Save Expense'
      expect(page).to have_content "Name can't be blank"
      expect(page).to have_content "Amount can't be blank"
    end

    it 'shows a success message and takes you back to category expenses page when clicking on Create Expense button' do
      visit @path
      fill_in 'Name', with: 'Test Expense'
      fill_in 'Amount', with: '10'
      click_on 'Save Expense'
      expect(page).to have_content 'Expense was successfully created'
      expect(current_path).to eql "/categories/#{@category1.id}/expenses"
    end

    it 'takes you back to category expenses page when clicking on back to expenses' do
      visit @path
      click_on 'Back to expenses'
      expect(current_path).to eql "/categories/#{@category1.id}/expenses"
    end
  end
end
