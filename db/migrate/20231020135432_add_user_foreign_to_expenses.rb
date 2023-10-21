class AddUserForeignToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :author, index: true, foreign_key: { to_table: :users }
  end
end
