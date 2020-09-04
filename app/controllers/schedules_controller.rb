class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def index
    @plan = Plan.find(params[:format])
    @day = @plan.day_hows
    @other_days = DayHow.where(plan_id: @plan.id)
    @plan.day_hows.each do |day_how| 
      @passed = day_how.passed
    end
    @group = @plan.group
    @schedules = @plan.schedules.includes(:group)
  end
  
  def create
    @schedule = Schedule.create( hour_id: schedule_params[:hour_id], minute_id: schedule_params[:minute_id], program: schedule_params[:program], category_id: schedule_params[:category_id], plan_id: schedule_params[:format], user_id: schedule_params[:user_id])
  end
  
  def update
  end
  
  def delete
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:hour_id, :minute_id, :program, :category_id, :format).merge(user_id: current_user.id)
    #formatはPlanのid
  end

  def move_to_new
    plan = Plan.find_by(plan_id: params[:plan_id])
    @schedules = plan.schedules.includes(:group)
    unless @schedules
      render :new
    end 
  end
end
