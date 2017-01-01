class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def new
    @group = Group.new
  end
  def edit
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'Success'
    end
    redirect_to groups_path
  end
  def show
    @group = Group.find(params[:id])
  end
  def update
  end
  # def destroy
  # end
private
  def group_params
    params.require(:group).permit(:title, :description)
  end

end
