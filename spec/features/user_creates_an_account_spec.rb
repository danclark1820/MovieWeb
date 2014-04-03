require 'spec_helper'

feature "User adds entry to registry", %q{
  As an un-authenticated user,
  I want to securely register for an account,
  so I can get ideas for what movies I should watch
} do

#  Acceptance Criteria
# *A sign up and authentication system for your users
# *I must provide  an unused email
# *I must provide a password
# *I must confirm my password


  it "can sign up" do
    count = User.count
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'


    expect(page).to have_content "Welcome to Movie Web"
    expect(User.count).to eql(count + 1)
  end
end
