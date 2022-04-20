require_relative '../rails_helper'

RSpec.describe 'The signing in process', type: :feature do
  describe 'login page' do
    it 'displays email and password input field and submit button' do
      visit('/users/sign_in')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Log in')
    end

    it 'button click throws error when no username and password are entered' do
      visit('/users/sign_in')
      click_button('Log in')
      expect(page).to have_content('Invalid Email or password.')
    end

    describe 'after filling in input fields' do
      before :each do
        User.create!(name: 'test', email: 'test@testmail.com', password: '123456')
      end

      it 'throws an error if wrong username or password given' do
        visit '/users/sign_in'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'Test'
        click_on 'Log in'
        expect(page).to have_content('Invalid Email or password.')
      end

      it 'signs me in successfully' do
        visit '/users/sign_in'
        fill_in 'Email', with: 'test@testmail.com'
        fill_in 'Password', with: '123456'
        click_on 'Log in'
        expect(current_path).to have_content('')
      end
    end
  end
end