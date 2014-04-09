def create_user_and_sign_in
  user = create :user
  visit root_path
  click_link 'Sign In'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log In'
end
