require_relative '../rails_helper'

RSpec.describe 'The categories index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Test User', email: 'test@testmail.com', password: '123456')

      @category1 = Category.create!(name: 'Test Category 1', icon: "wwww.testicon.com", user_id: @user1.id)

      @category2 = Category.create!(name: 'Test Category 2', icon: "wwww.testicon.com", user_id: @user1.id)

      @expense1 = @category1.expenses.create(name: 'Test Expense', amount: 10, user_id: @user1.id)

      @expense2 = @category1.expenses.create(name: 'Test Expense 2', amount: 10, user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'test@testmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    it 'displays a list of all categories' do
      visit '/'
      expect(page).to have_content 'CATEGORIES'
      expect(page).to have_content 'Test Category 1'
      expect(page).to have_content 'Test Category 2'
    end

    it 'displays the total expenses for each category' do
      visit '/'
      expect(page).to have_content 'Total Expenses: $20.0'
    end

    it 'has a button to create new category' do
      visit '/'
      expect(page).to have_content 'New category'
    end

    it 'takes you to all transactions for current category when clicking on a category item' do
      visit '/'
      click_on 'Test Category 2'
      expect(current_path).to eql "/expenses.#{@category2.id}"
    end
  end
end
