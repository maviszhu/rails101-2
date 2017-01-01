class PostsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end
  def update
    find_post_and_check_permission
    if @post.update(post_params)
      redirect_to account_posts_path, notice: 'Updated Success!'
    else
      render :edit
    end
  end
  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    find_post_and_check_permission
    @post.destroy
    redirect_to account_posts_path, alert: "Post Deleted!"
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
  def find_post_and_check_permission
  @post = Post.find(params[:id])
  @group = @post.group
  if current_user != @post.user
    redirect_to root_path, alert: 'You have no permission.'
  end
end
end
