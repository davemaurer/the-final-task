require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  it 'has a create action' do
    user = User.create!(email: 'newuser@newuser.com', password: 'password')
    list = user.lists.create!(title: 'newlist', description: 'newlistdesc')
    task = list.tasks.create!(title: 'newtask', notes: 'none')

    expect(task.title).to eq 'newtask'
    expect(task.notes).to eq 'none'
  end
end
