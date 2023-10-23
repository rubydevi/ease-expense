class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @user = current_user
    # add sum later
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = @user.categories.build(user_id: @user.id, **category_params)
    if @category.save
      redirect_to user_categories_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
