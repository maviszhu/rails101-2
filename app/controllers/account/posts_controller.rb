class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts.order("created_at DESC")
  end
  def edit
    @post = current_user.posts.find(params[:id])
    @group = @post.group
  end

end
