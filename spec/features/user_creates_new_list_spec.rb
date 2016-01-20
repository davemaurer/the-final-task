require 'rails_helper'

RSpec.feature "User can create a list" do
  scenario "successfully" do
    User.create!(email: "newuser@newuser.com", password: "password")
    log_in_user

    expect(page).to have_content 'Hello, newuser@newuser.com'

    fill_in 'Title', with: 'newlist'
    fill_in 'Description', with: 'awesome'

    click_button "Create List"
    expect(page).to have_content 'newlist'
    expect(page).to have_content 'awesome'
  end

  scenario "successfully without description" do
    User.create!(email: "newuser@newuser.com", password: "password")
    log_in_user

    expect(page).to have_content 'Hello, newuser@newuser.com'

    fill_in 'Title', with: 'newlist'
    fill_in 'Description', with: ''

    click_button "Create List"
    expect(page).to have_content 'newlist'
    expect(page).to have_content 'List created!'
  end

  scenario "unsuccessfully" do
    User.create!(email: "newuser@newuser.com", password: "password")
    log_in_user

    expect(page).to have_content 'Hello, newuser@newuser.com'

    fill_in 'Title', with: ''
    fill_in 'Description', with: 'awesome'

    click_button "Create List"
    expect(page).not_to have_content 'newlist'
    expect(page).to have_content 'Please try again'
  end
end
