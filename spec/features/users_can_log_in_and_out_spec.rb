require 'rails_helper'

RSpec.feature "User login/logout" do
  scenario "unregistered user sees sign up option" do
    visit root_path

    expect(page).to have_content('Sign Up Here')
  end

  scenario "unregistered user creates an account" do
    visit root_path

    click_link('Sign Up Here')

    expect(User.count).to eq(0)

    expect(current_path).to eq('/users/new')
    fill_in 'Email', with: 'newuser@newuser.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on('Submit')

    expect(User.count).to eq(1)
    expect(User.first.email).to eq('newuser@newuser.com')
    expect(current_path).to eq(lists_path)
    expect(page).to have_content('Hello, newuser@newuser.com')
  end

  scenario "unregistered user cannot use a duplicate email" do
    visit root_path

    click_link('Sign Up Here')

    expect(User.count).to eq(0)

    fill_in 'Email', with: 'newuser@newuser.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on('Submit')

    expect(User.count).to eq(1)

    visit root_path

    click_link('Sign Up Here')

    fill_in 'Email', with: 'newuser@newuser.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on('Submit')

    expect(User.count).to eq(1)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Something went wrong. Please try again.')
  end

  scenario "user cannot leave password blank during sign up" do
    visit root_path

    click_link('Sign Up Here')

    expect(User.count).to eq(0)

    fill_in 'Email', with: 'newuser@newuser.com'
    fill_in 'Password', with: ''
    fill_in 'Confirm Password', with: ''
    click_on('Submit')

    expect(User.count).to eq(0)
    expect(page).to have_content('Something went wrong. Please try again.')
  end

  scenario "user cannot leave password confirmation blank during sign up" do
    visit root_path

    click_link('Sign Up Here')

    expect(User.count).to eq(0)

    fill_in 'Email', with: 'newuser@newuser.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: ''
    click_on('Submit')

    expect(User.count).to eq(0)
    expect(page).to have_content('Something went wrong. Please try again.')
  end

  scenario "user cannot leave email blank during sign up" do
    visit root_path

    click_link('Sign Up Here')

    expect(User.count).to eq(0)

    fill_in 'Email', with: ''
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_on('Submit')

    expect(User.count).to eq(0)
    expect(page).to have_content('Something went wrong. Please try again.')
  end

  scenario "registered user can log in" do
    User.create!(email: 'newuser@newuser.com', password: 'password')

    visit root_path

    click_link('Log In')

    fill_in 'Email', with: 'newuser@newuser.com'
    fill_in 'Password', with: 'password'
    click_on('Submit')

    expect(page).to have_content('Login Successful. Welcome Back.')
    expect(current_path).to eq(lists_path)
  end

  scenario "registered user can log out" do
    User.create!(email: 'newuser@newuser.com', password: 'password')
    log_in_user

    expect(current_path).to eq(lists_path)
    click_on('Logout')

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Thanks for Tasking...You are now logged out.')
  end

  scenario "unregistered user can not log in" do
    visit root_path

    click_link('Log In')

    fill_in 'Email', with: 'nicetry@try.com'
    fill_in 'Password', with: 'password'
    click_on('Submit')

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Invalid login. Please try again.')
  end
end
