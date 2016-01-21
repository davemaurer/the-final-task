require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'has a new action' do
    get :new

    expect(response.status).to eq(200)
  end

  it 'has a create action' do
    user = User.create!(email: 'newuser@newuser.com', password: 'password')
    post :create, { session: { user_id: user.id }}

    expect(response.status).to eq(200)
  end

  it 'has a destroy action' do
    user = User.create(email: 'newuser@newuser.com', password: 'password')
    session = {user_id: user.id}

    post :create, session: session
    expect(response.status).to eq 200
    get :destroy, session: session
    expect(response.status).to eq 302
  end
end
