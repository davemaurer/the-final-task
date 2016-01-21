require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it 'has an index action' do
    get :index

    expect(response.status).to eq(200)
  end
end
