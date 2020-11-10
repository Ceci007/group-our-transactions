class DecorsController < ApplicationController
  before_action :set_user, only: %i[show index create destroy unlisted update]
  before_action :require_login, only: %i[index]
  before_action :require_user, only: %i[unlisted destroy index]
  before_action :set_decor, only: %i[edit destroy update]

  def index
    @decors = @user.decors.ordered_by_most_recent.includes(:category)
    @total = @decors.pluck(:price).sum
  end

  def new
    @decor = Decor.new
  end

  def edit; end

  def update
    if @decor.update(decor_params)
      redirect_to user_decors_path, notice: 'Decor was successfully edited.'
    else
      render 'edit'
    end
  end

  def create
    @decor = @user.decors.build(decor_params)
    if @decor.save
      redirect_to user_decors_path, notice: 'You successfully created a new decor.'
    else
      render 'new'
    end
  end

  def unlisted
    @decors = @user.decors.with_no_category.ordered_by_most_recent
    @total = @decors.pluck(:price).sum
  end

  def destroy
    @decor.destroy
    redirect_to user_decors_path, notice: 'Decor successfully deleted.'
  end

  private

  def decor_params
    params.require(:decor).permit(:name, :price, :category_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_decor
    @decor = Decor.find(params[:id])
  end

  def require_user
    redirect_to user_decors_path(current_user) if current_user != @user
  end
end