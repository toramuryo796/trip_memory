class GroupsController < ApplicationController
  def index
    @groups = Group.all.order("name DESC")
    @group = Group.new
  end

  def new
    @group = Group.new
  end

  def create
    binding.pry
    group_params
  end
  
  def show
  end
  
  private
  def group_params
    params.require(:group).permit(:commit, :name, members:[]).merge(user_id: current_user.id)
  end
end
