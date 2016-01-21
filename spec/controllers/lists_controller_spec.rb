require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  it 'has a create action' do
    user = User.create!(email: 'newuser@newuser.com', password: 'password')
    list = user.lists.create!(title: 'newlist', description: 'newlistdesc')

    expect(list.title).to eq 'newlist'
    expect(list.description).to eq 'newlistdesc'
  end

  it 'has an edit action' do
    user = User.create!(email: 'newuser@newuser.com', password: 'password')
    list = user.lists.create!(title: 'newlist', description: 'newlistdesc')

    expect(list.title).to eq 'newlist'
    expect(list.description).to eq 'newlistdesc'

    put :update, id: list.id, list: { title: 'oldlist', description: 'olddesc' }

    expect(response.status).to eq 302
  end

  it 'has a destroy action' do
    user = User.create(email: 'newuser@newuser.com', password: 'password')
    list = List.create!(title: 'newlist', description: 'newlistesc', user_id: user.id)

    delete :destroy, id: list.id
    expect(response.status).to eq 302
  end
end
