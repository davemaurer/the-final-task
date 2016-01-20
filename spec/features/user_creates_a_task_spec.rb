require 'rails_helper'

RSpec.feature "User can view the tasks page for a list" do
  scenario "successfully" do
    user = User.create!(email: "newuser@newuser.com", password: "password")
    list = List.create!(title: "newlist", description: "awesome", user_id: user.id)
    log_in_user

    expect(page).to have_content 'newlist'

    click_on 'See Tasks for This List'

    expect(page).to have_content 'You are viewing tasks for newlist'
    expect(page).to have_content 'Create A New Task'
    expect(list.tasks.count).to eq(0)

    fill_in 'Title', with: 'newtask'
    fill_in 'Notes', with: 'notes for the brandnewtask'

    click_on 'Create Task'

    expect(page).to have_content 'Task newtask created'
    expect(page).to have_content 'notes for the brandnewtask'
    expect(list.tasks.count).to eq(1)
  end
end
