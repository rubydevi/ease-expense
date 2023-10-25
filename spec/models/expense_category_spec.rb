require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  let(:user) { User.new(id: 1, name: 'ruby', email: 'ruby@mail.com', password: 'ruby123') }
  before { user.save }

  let(:category) { Category.new(id: 1, name: 'online', icon: 'https://cdn-icons-png.flaticon.com/512/1384/1384023.png', user_id: 1) }
  before { category.save }

  let(:expense) { Expense.new(id: 1, name: 'games', amount: 100, author_id: user.id) }
  before { expense.save }

  it 'is valid with valid attributes' do
    expense_category = ExpenseCategory.new(expense:, category:)
    expect(expense_category).to be_valid
  end

  it 'is associated with an expense' do
    expense_category = ExpenseCategory.new(
      expense:,
      category:
    )
    expect(expense_category.expense).to eq(expense)
  end

  it 'is associated with a category' do
    expense_category = ExpenseCategory.new(
      expense:,
      category:
    )
    expect(expense_category.category).to eq(category)
  end
end
