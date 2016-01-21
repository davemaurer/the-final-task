require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a title and notes" do
    task = Task.create!(title: 'get shorty', notes: 'none')

    expect(task.title).to eq('get shorty')
    expect(task.notes).to eq('none')
  end

  it "is valid" do
    task = Task.create!(title: 'get shorty', notes: 'none')

    expect(task).to be_valid
  end

  it "is invalid without a title" do
    task = Task.create(title: '', notes: 'none')

    expect(task).not_to be_valid
  end
end
