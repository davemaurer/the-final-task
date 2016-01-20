require 'rails_helper'

RSpec.feature "User can edit a list" do
  scenario "successfully" do
    User.create!(email: "newuser@newuser.com", password: "password")
    log_in_user

    fill_in 'Title', with: 'newlist'
    fill_in 'Description', with: 'awesome'

    click_button "Create List"

    click_on "Edit This List"

    expect(page).to have_content 'Edit This List'

    fill_in 'Title', with: 'editedlist'
    fill_in 'Description', with: 'pie'

    click_on 'Submit'

    expect(current_path).to eq(lists_path)
    expect(page).to have_content 'List Updated Successfully'
    expect(page).to have_content 'editedlist'
    expect(page).not_to have_content 'newlist'
  end
end
