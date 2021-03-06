def create_user_and_sign_in
  @user = create :user
  visit root_path
  click_link 'Sign Up'
  fill_in 'Name', with: @user.name
  fill_in 'Email', with: Faker::Internet.email
  fill_in 'Password', with: @user.password
  fill_in 'Password confirmation', with: @user.password
  click_button 'Sign Up'
end
