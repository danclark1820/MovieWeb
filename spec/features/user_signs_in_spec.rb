require 'spec_helper'

feature "User adds entry to registry", %q{
  As an un-authenticated user,
  I want to securely sign in to my account,
  so I can get ideas for what movies I should watch
} do

  #Acceptance Criteria
  # *I must specify my email
  # *I must specify my password

  it 'signs in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
    expect(page).to have_content 'Welcome to Movie Web'
  end
end
