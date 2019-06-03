class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user_posts, only: [:index, :recent]

  def index    
    @posts = Post.where(user_id: current_user).order(created_at: :desc)
    if params[:category]
      @posts = @posts.where(category: params[:category])
    end
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save 
      redirect_to(@post, :flash => [:success])
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: "You successfully updated your post!"
    else
      render :edit
    end
  end

  def show
    authorize @post
  end

  def destroy
    authorize @post
    if @post.destroy
      redirect_to root_path, notice: 'Your post was deleted successfully'
    else
      render post_path
    end
  end

  def recent
    @posts = @posts.limit(4)
  end

  def search  
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else
      @parameter = params[:search].downcase  
      @post_results = Post.where("lower(description) LIKE :search", search: "%#{@parameter}%").order(created_at: :desc)
      @category_results = @categories.where("lower(name) LIKE :search", search: "%#{@parameter}%").order(created_at: :desc)    
    end
  end


  private

  def post_params
    params.require(:post).permit(:description, :code, :user_id, :category_id, :slug)
  end

  def set_post
    @post = Post.find_by!(params[slug: :category_id])
  end

  def set_current_user_posts
    @posts = Post.where(user_id: current_user).order(created_at: :desc)
  end
end
