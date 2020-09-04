class DayHowsController < ApplicationController
  def index
    @group = Group.find(params[:id])
    @days = DayHow.all.includes(:group)
  end 

  def new
    @day = DayHow.new
    @plan = Plan.find_by(id: params[:plan_id])
    @plan_id = @plan.id 
  end

  def create
    @other_day = DayHow.new(day: day_how_params[:day], plan_id: day_how_params[:plan_id])
    if @other_day.save
      redirect_to schedules_path
    else
      redirect_to group_plans_path
    end
  end

  private
  def day_how_params
    params.permit(:passed).merge(user_id: current_user.id, group_id: params[:group_id], plan_id: params[:plan_id])
  end
end
