class GroupsController < ApplicationController
  def index
    @groups = Group.all.order("name DESC")
    @group = Group.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(name: group_params[:name])
    members = group_params[:members]
    user_ids = []
    @user = nil
    @user_group = nil 
    count = 0
    members.each do |member|
      @user = User.find_by(nickname: member)
      @user_group = UserGroup.new(group_id: @group.id, user_id: @user.id) 
      if @user_group.save
        count += 1
      end
    end
    if count == members.length
      redirect_to group_path(@group)
    else
      redirect_to :new
    end
  end
  
  def show
  end
  
  private
  def group_params
    params.require(:group).permit(:commit, :name, members:[]).merge(user_id: current_user.id)
  end
end
