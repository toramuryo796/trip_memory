class MemoriesController < ApplicationController
  before_action :find_memory, only: [:show, :edit, :update, :destroy]
  before_action :find_group_user
  def index
    @memories = @group.memories
  end
  
  def new
    @plan = Plan.find_by(id: params[:plan_id]) 
    @group = @plan.group
    @candidate = @plan.candidate
    @user = current_user
    @memory = Memory.new
  end
  
  def create
    memory = Memory.create(memory_params)
    plan = memory.plan
    group = plan.group
    if memory.save
      redirect_to group_memories_path(plan_id: plan.id)
    else
      redirect_to new_group_memory_path(group, memory, plan_id: plan.id)
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @memory.update(memory_params)
      redirect_to group_memory_path(@group, @memory)
    else
      render :edit
    end
  end
  
  def destroy
    @memory.destroy
    redirect_to group_memories_path(@group, @memory)
  end
  
  private
  def memory_params
    params.require(:memory).permit(:title, :departure_day, :return_day, :transportation_id,  :trans_memo, :hotel, :hotel_memo, :best, :happening, :again, :plan_id, :destination, images: []).merge(user_id: current_user.id, group_id: params[:group_id])
  end
  
  def find_memory
    @memory = Memory.find(params[:id])
    @group = @memory.group
  end
  
  def find_group_user
    @group = Group.find_by(id: params[:group_id])
    @user = current_user
  end
end