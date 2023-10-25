require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.new(id: 1, name: 'ruby', email: 'ruby@mail.com', password: 'ruby123') }
  before { user.save }

  let(:category) { Category.new(id: 1, name: 'online', icon: 'https://cdn-icons-png.flaticon.com/512/1384/1384023.png', user_id: 1) }
  before { category.save }

  it 'is valid with valid attributes' do
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(
      icon: 'cutlery'
    )
    expect(category).not_to be_valid
  end

  it 'is not valid without an icon' do
    category = Category.new(
      name: 'Food'
    )
    expect(category).not_to be_valid
  end

  it 'is associated with a user' do
    category = Category.new(
      name: 'Food',
      icon: 'cutlery',
      user:
    )
    expect(category.user).to eq(user)
  end
end
