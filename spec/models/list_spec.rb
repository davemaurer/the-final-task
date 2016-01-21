require 'rails_helper'

RSpec.describe List, type: :model do
  it "has a title and notes" do
    list = List.create!(title: 'mylist', description: 'sweetness')

    expect(list.title).to eq('mylist')
    expect(list.description).to eq('sweetness')
  end

  it "is valid" do
    list = List.create!(title: 'mylist', description: 'sweetness')

    expect(list).to be_valid
  end

  it "is invalid without a title" do
    list = List.create(title: '', description: 'sweetness')

    expect(list).not_to be_valid
  end
end
