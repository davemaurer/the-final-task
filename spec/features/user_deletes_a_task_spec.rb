require 'rails_helper'

RSpec.feature "User deletes a task for a list" do
  scenario "successfully" do
    user = User.create!(email: "newuser@newuser.com", password: "password")
    list = List.create!(title: "newlist", description: "awesome", user_id: user.id)
    log_in_user

    click_on 'See Tasks for This List'

    fill_in 'Title', with: 'newtask'
    fill_in 'Notes', with: 'notes for the brandnewtask'

    click_on 'Create Task'

    expect(list.tasks.count).to eq(1)

    click_on 'Delete This Task'

    expect(page).to have_content 'Task removed'
    expect(page).not_to have_content 'newtask'
    expect(list.tasks.count).to eq(0)
  end
end
