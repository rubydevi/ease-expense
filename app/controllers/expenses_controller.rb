class ExpensesController < ApplicationController
  def index
    @categories = Category.all
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @category_expenses = @category.expense_categories.order(created_at: :desc)
    else
      @expenses = Expense.all.order(created_at: :desc)
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    # find category id from params to save in expense_category table
    @category = Category.find(params[:category_id])
    @user = current_user
    @expense = @user.expenses.build(author_id: @user.id, **expense_params)
    if @expense.save
      # create expense_category record when expense is saved
      ExpenseCategory.create(expense_id: @expense.id, category_id: @category.id)
      redirect_to user_category_expenses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id)
  end
end
