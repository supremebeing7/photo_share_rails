require 'spec_helper'

describe Photo do
  context 'creating' do
    it 'lets a signed in user add photos' do
      create_user_and_sign_in
      click_link "Add Photo"
      attach_file("Photo", File.expand_path("./app/assets/images/spacecat.png"))
      fill_in "Caption", with: "whatever!"
      click_button "Create Photo"
      page.should have_xpath("//img[@alt='Spacecat']")
    end
  end
  context 'deleting' do
    it 'lets a signed in user delete a photo' do
      create_user_and_sign_in
      click_link "Add Photo"
      attach_file("Photo", File.expand_path("./app/assets/images/spacecat.png"))
      fill_in "Caption", with: "whatever!"
      click_button "Create Photo"
      click_link "#{@user.name}"
      click_link "Delete Photo"
      page.should have_content "Photo deleted"
    end
    it 'lets a signed in user delete his/her account' do
      create_user_and_sign_in
      click_link "#{@user.name}"
      click_link "Delete Account"
      page.should have_content "Account deleted"
    end
  end
end
