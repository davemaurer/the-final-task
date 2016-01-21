require 'rails_helper'

RSpec.feature "User can edit a list" do
  scenario "successfully" do
    user = User.create!(email: "newuser@newuser.com", password: "password")
    list = List.create!(title: "newlist", description: "awesome", user_id: user.id)
    log_in_user

    expect(page).to have_content 'newlist'

    click_on 'See Tasks for This List'

    fill_in 'Title', with: 'newtask'
    fill_in 'Notes', with: 'notes for the brandnewtask'

    click_on 'Create Task'
    click_on 'Edit This Task'

    fill_in 'Title', with: 'banana'
    fill_in 'Notes', with: 'gooooood'

    click_on 'Submit'

    expect(page).to have_content 'Task Updated Successfully'
    expect(page).to have_content 'banana'
    expect(page).not_to have_content 'newtask'
  end
end
