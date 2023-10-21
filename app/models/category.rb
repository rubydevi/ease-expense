class Category < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id'
  has_many :expense_categories, dependent: :destroy
  has_many :expenses, through: :expense_categories, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end