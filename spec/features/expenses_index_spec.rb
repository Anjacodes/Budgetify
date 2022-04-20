require_relative '../rails_helper'

RSpec.describe 'The expenses index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Test User', email: 'test@testmail.com', password: '123456')

      @category1 = Category.create!(name: 'Test Category 1', icon: "wwww.testicon.com", user_id: @user1.id)

      @expense1 = @category1.expenses.create(name: 'Test Expense', amount: 10, user_id: @user1.id)

      @expense2 = @category1.expenses.create(name: 'Test Expense 2', amount: 10, user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'test@testmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'

      @path = "/expenses.#{@category1.id}"
    end

    it 'displays a list of all transactions for a certain categories' do
      visit @path
      expect(page).to have_content 'Test Category 1'
      expect(page).to_not have_content 'Test Category 2'
    end

    it 'displays the total of all expenses for this category' do
      visit @path
      expect(page).to have_content 'Total Expenses: $20.0'
    end

    it 'has a button to create a new expense' do
      visit @path
      expect(page).to have_content 'New expense'
    end

    it 'takes you back to home when clicking on Back button' do
      visit @path
      find(:xpath, "/html/body/header/a").click
      expect(current_path).to eql "/"
    end

    it 'takes you to a page to create an expense when clicking on new expense button' do
      visit @path
      click_on 'New expense'
      expect(current_path).to eql "/expenses/new.#{@category1.id}"
    end
  end
end
