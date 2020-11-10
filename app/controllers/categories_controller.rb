class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy edit update]
  before_action :icons_array, only: %i[new create edit update]

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:notice] = 'You successfully created a new category.'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category was successfully edited.'
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def index
    @categories = Category.all.alphabetical_order.includes(:user)
  end

  def show
    @decors = @category.decors.includes(:user)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def icons_array
    @category_array = icons
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end