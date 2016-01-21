require 'rails_helper'

RSpec.feature "User can delete a list" do
  scenario "successfully" do
    user = User.create!(email: "newuser@newuser.com", password: "password")
    log_in_user

    fill_in 'Title', with: 'newlist'
    fill_in 'Description', with: 'awesome'

    click_button "Create List"

    expect(user.lists.count).to eq(1)
    click_on "Delete this List"

    expect(current_path).to eq(lists_path)
    expect(page).to have_content 'Your list has been deleted.'
    expect(page).not_to have_content 'newlist'
    expect(user.lists.count).to eq(0)
  end
end
