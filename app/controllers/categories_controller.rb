class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index   
  end

  def show
    authorize @category
    @post = Category.find_by(params[:category_id])
  end

  def top_four
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    
    if already_four? && @category.status == "top_four"
      redirect_to(root_path, alert: "#{@category.name.capitalize} was not saved. You already have four top categories. Please remove one if you would like to add a new top category.")
    elsif @category.save 
      redirect_to(@category, :flash => [:success])
    else
      render :new
    end
  end

  def edit
    authorize @category
  end

  def update
    authorize @category
    if @category.update(category_params)
      redirect_to @category, notice: "You successfully updated your post!"
    else
      render :edit
    end
  end

  def destroy
    authorize @category
    if @category.destroy
      redirect_to root_path, notice: 'Your category was deleted successfully'
    else
      render :show, alert: 'Your category could not be deleted'
    end
  end


  private

  def set_category
    @category = Category.find_by!(params[slug: :name])
  end

  def category_params
    params.require(:category).permit(:name, :status, :user_id, :slug)
  end

  def already_four?
    @categories.where(status: 1).count >= 4   
  end
end
