require 'rails_helper'

RSpec.feature "User can view the tasks page for a list" do
  scenario "successfully" do
    User.create!(email: "newuser@newuser.com", password: "password")
    log_in_user

    fill_in 'Title', with: 'newlist'
    fill_in 'Description', with: 'awesome'

    click_button "Create List"

    expect(page).to have_content 'newlist'

    click_on 'See Tasks for This List'

    expect(page).to have_content 'You are viewing tasks for newlist'
    expect(page).to have_content 'Create A New Task'
  end
end
