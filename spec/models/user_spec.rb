require 'rails_helper'

RSpec.describe User, type: :model do
  it "has an email" do
    user = User.create!(email: 'new@new.com', password: 'password')

    expect(user.email).to eq('new@new.com')
  end

  it "is valid" do
    user = User.create!(email: 'new@new.com', password: 'password')

    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.create(email: '', password: 'password')

    expect(user).not_to be_valid
  end
end
