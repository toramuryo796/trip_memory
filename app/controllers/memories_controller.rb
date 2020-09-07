class MemoriesController < ApplicationController
  def index
    @group = Group.find_by(id: params[:group_id])
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
    binding.pry
    group = plan.group
    if memory.save
      redirect_to group_memories_path(plan_id: plan.id)
    else
      redirect_to new_group_memory_path(group, memory, plan_id: plan.id)
    end
  end

  def update
  end

  private
  def memory_params
    params.require(:memory).permit(:title, :departure_day, :return_day, :transportaion_id, :trans_memo, :hotel, :hotel_memo, :best, :happening, :again, :plan_id, images:[]).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
