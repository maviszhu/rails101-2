class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def new
    @group = Group.new
  end
#def edit
#end
  def create
  end
  def show
  end
  def update
  end
  # def destroy
  # end

end
