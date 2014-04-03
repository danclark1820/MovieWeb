require 'spec_helper'

feature "User adds entry to registry", %q{
  As an un-authenticated user,
  I want to securely register for an account,
  so that I can rate movies.
} do

#  Acceptance Criteria
# *A sign up and authentication system for your users
# *I must provide a username
# *I must provide  an unused email
# *I must provide a password
# *Provide an option for first name and last name

  it "can sign up" do
    count = User.count
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'

    expect(page).to have_content "Welcome"
    expect(User.count).to eql(count + 1)
  end
end
