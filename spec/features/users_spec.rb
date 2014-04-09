require 'spec_helper'

describe User do
  context 'creating' do
    it 'lets a user sign up' do
      user = build :user
      visit root_path
      click_link 'Sign Up'
      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign Up'
      page.should have_content 'Thanks for signing up!'
      page.should have_content "Logged in as #{user.name}"
    end
  end

  context 'sign in' do
    it 'lets a user log in' do
      user = create :user
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'
      page.should have_content "Logged in as #{user.name}"
    end
  end

  context 'sign out' do
    it 'lets a user log out' do
      user = create :user
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'
      click_link 'Sign Out'
      page.should have_content "Logged out!"
    end
  end
end
