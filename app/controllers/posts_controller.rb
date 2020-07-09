class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @posts = policy_scope(Post)
  end
end
