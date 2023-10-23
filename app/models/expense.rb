class Expense < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id'

  has_many :expense_categories, dependent: :destroy
  has_many :categories, through: :expense_categories, dependent: :destroy

  # Validation
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
