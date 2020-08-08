class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = policy_scope(Comment).order(created_at: :desc)
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @related_posts = @post.find_related_categories
    @comment.post = @post
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def edit
    # @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    authorize @comment
  end

  def update
    # @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    authorize @comment
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    # @comment = Comment.find(params[:id])
    @post = @comment.post
    authorize @comment
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
