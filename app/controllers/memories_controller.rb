class MemoriesController < ApplicationController
  def index
    @plan = Plan.find_by(id: params[:plan_id])
    @group = Group.find_by(id: params[:group_id])
    @memories = @plan.memories
  end

  def new
    @plan = Plan.find(params[:plan_id]) 
    @group = @plan.group
    @candidate = @plan.candidate
    @user = current_user
    @memory = Memory.new
  end

  def create
    @memory = Memory.find(params[:id])
  end

  def update
  end

  private
  def memory_params
    params.require(:group, :memory).permit(:title, :departure_day, :return_day, :transportaion_id, :trans_memo, :hotel, :hotel_memo, :best, :happening, :again, images:[]).merge(paln_id: params[:plan_id], user_id: current_user.id)
  end
end
