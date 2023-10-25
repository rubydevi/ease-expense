require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password'
    )
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(
      email: 'john@example.com',
      password: 'password'
    )
    expect(user).not_to be_valid
  end

  it 'has many expenses' do
    user = User.reflect_on_association(:expenses)
    expect(user.macro).to eq(:has_many)
  end

  it 'has many categories' do
    user = User.reflect_on_association(:categories)
    expect(user.macro).to eq(:has_many)
  end
end
