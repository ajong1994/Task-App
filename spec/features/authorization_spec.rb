require 'rails_helper'

RSpec.describe 'Auth', type: :feature do

    describe '#9: As a User, I want to create my account so that I can have my own credentials.' do
        context 'Valid input' do
            it 'visits sign in page and creates user after filling out fields' do
                visit new_user_registration_path
                fill_in 'user_email', with: 'sample2@example.com'
                fill_in 'user_password', with: 'Password'
                fill_in 'user_password_confirmation', with: 'Password'
                click_on ('Sign up')
                expect(page).to have_content('Welcome! You have signed up successfully.')
            end
        end

        context 'Invalid input' do
            it 'Does not redirect and displays error when passwords dont match' do
                visit new_user_registration_path
                fill_in 'user_email', with: 'sample2@example.com'
                fill_in 'user_password', with: 'Password'
                fill_in 'user_password_confirmation', with: 'Password2'
                click_on ('Sign up')
                expect(page).to have_content('Password confirmation doesn\'t match Password')
            end

            it 'Does not redirect and displays error when password is too short' do
                visit new_user_registration_path
                fill_in 'user_email', with: 'sample2@example.com'
                fill_in 'user_password', with: 'Passw'
                fill_in 'user_password_confirmation', with: 'Passw'
                click_on ('Sign up')
                expect(page).to have_content('Password is too short (minimum is 6 characters)')
            end
        end
    end

    describe '#10: As s User, I want to login my account so that I can access my account and link my own tasks.' do
        context 'Valid input' do
            it 'visits sign in page and successfully logs in' do
                visit new_user_session_path
                create(:user)
                fill_in 'user_email', with: 'sample@example.com'
                fill_in 'user_password', with: 'Password'
                click_on ('Log in')
                expect(page).to have_content('Signed in successfully.')
            end
        end

        context 'Invalid input' do
            it 'visits sign in page and does not redirect when credentials are wrong' do
                visit new_user_session_path
                create(:user)
                fill_in 'user_email', with: 'sample@example.com'
                fill_in 'user_password', with: 'Pass'
                click_on ('Log in')
                expect(page).to_not have_content('Signed in successfully.')
            end
        end
    end
end





