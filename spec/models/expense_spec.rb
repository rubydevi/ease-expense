require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.new(id: 1, name: 'ruby', email: 'ruby@mail.com', password: 'ruby123') }
  before { user.save }

  let(:expense) { Expense.new(id: 1, name: 'games', amount: 100, author_id: user.id) }
  before { expense.save }

  it 'is valid with valid attributes' do
    expect(expense).to be_valid
  end

  it 'is not valid without a name' do
    expense = Expense.new(
      amount: 50.0,
      author_id: user.id
    )
    expect(expense).not_to be_valid
  end

  it 'is not valid without an amount' do
    expense = Expense.new(
      name: 'Groceries',
      author_id: user.id
    )
    expect(expense).not_to be_valid
  end

  it 'is not valid with a negative amount' do
    expense = Expense.new(
      name: 'Groceries',
      amount: -10.0,
      author_id: user.id
    )
    expect(expense).not_to be_valid
  end

  it 'is associated with an author (User)' do
    expense = Expense.new(
      name: 'Groceries',
      amount: 50.0,
      author: user
    )
    expect(expense.author).to eq(user)
  end
end
