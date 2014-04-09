require 'spec_helper'

describe Photo do
  context 'creating' do
    it 'lets a signed in user add photos' do
      create_user_and_sign_in
      click_link "Add Photo"
      attach_file("Photo", File.expand_path("./app/EOwsjaMZ.png"))
      fill_in "Caption", with: "whatever!"
      click_button "Create Photo"
      page.should have_xpath("//img[@alt='Eowsjamz']")
    end
  end
end
