require 'spec_helper'

describe  "Signing Up" do
  it "allows a user to sign up for the site and creates the object in the database" do
    expect(User.count).to eq(0)

    visit('/')
    expect(page).to have_content("Sign Up")
    click_link "Sign Up"

    fill_in "First Name",            with: "Mark"
    fill_in "Last Name",             with: "Hustad"
    fill_in "Password",              with: "password123"
    fill_in "Password Confirmation", with: "password123"
    click_button "Sign Up"


    expect(User.count).to eq(1)

  end
end