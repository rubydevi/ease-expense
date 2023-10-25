require 'rails_helper'

RSpec.describe 'Category Index Page', type: :feature do
  before(:each) do
    @user = User.create(id: 1, name: 'ruby', email: 'ruby@mail.com', password: 'ruby123')

    sign_in @user

    @categories = [
      Category.create(
        id: 1,
        name: 'Foods',
        icon: 'https://cdn-icons-png.flaticon.com/512/1384/1384023.png',
        user_id: @user.id
      ),
      Category.create(
        id: 2,
        name: 'Gadgets',
        icon: 'https://cdn-icons-png.flaticon.com/512/1384/1384023.png',
        user_id: @user.id
      )
    ]

    visit user_categories_path(@user.id)
    sleep(5)
  end

  describe 'database content' do
    it 'can see each category\'s name.' do
      @categories.each do |category|
        expect(page).to have_content(category.name)
      end
    end

    it 'can see each category\'s icon' do
      @categories.each do |category|
        expect(page).to have_css("img[src='#{category.icon}']")
      end
    end

    it 'can see each category\'s total expenditure' do
      @categories.each do |category|
        expect(page).to have_content(format('%.2f', category.expenses.sum(:amount)))
      end
    end

    it 'can see all the categories' do
      expect(@categories.count).to eq(2)
    end

    it 'redirects to the new category form when clicking "Add Category" button' do
      click_link 'Add Category'
      expect(page).to have_current_path(new_user_category_path(@user.id))
    end
  end
end
