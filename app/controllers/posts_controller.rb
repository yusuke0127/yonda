class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :categorized, :search_post]

  def index
    @posts = policy_scope(Post).order(created_at: :desc)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @related_posts = @post.find_related_categories
    @comments = @post.comments.reverse
    @comment = Comment.new
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @posts = policy_scope(Post).order(created_at: :desc)
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to post_path(@post)
    else
      render :index
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  def categorized
    if params[:category].present?
      @posts = Post.tagged_with(params[:category])
      @category = params[:category]
      authorize @posts
    else
      redirect_to posts_path
    end
  end

  def search_post
    if params[:query].present?
      @posts = Post.search_by_title_and_content(params[:query])
    else
      @posts = policy_scope(Post).order(created_at: :desc)
    end
    @query = params[:query]
    authorize @posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_list: [])
  end
end
