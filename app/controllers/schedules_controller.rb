class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def index
    binding
    @plan = Plan.find(params[:format])
    @group = @plan.group
    @schedules = @plan.schedules.includes(:group)
  end
  
  def create
    @schedule = Schedule.create( hour_id: schedule_params[:hour_id], minute_id: schedule_params[:minute_id], program: schedule_params[:program], category_id: schedule_params[:category_id], plan_id: schedule_params[:format], user_id: schedule_params[:user_id], day: schedule_params[:day]) 
    binding.pry.pry
  end
  
  def update
  end
  
  def delete
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:hour_id, :minute_id, :program, :category_id, :format, :day).merge(user_id: current_user.id)
  end

  def move_to_new
    plan = Plan.find_by(plan_id: params[:plan_id])
    @schedules = plan.schedules.includes(:group)
    unless @schedules
      render :new
    end 
  end
end
