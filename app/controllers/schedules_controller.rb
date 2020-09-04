class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:edit, :destroy]

  def new
  end
  
  def index
    @plan = Plan.find(params[:format])
    @day = @plan.day_hows
    @plan_id = @plan.id
    @other_days = DayHow.where(plan_id: @plan.id)
    @group = @plan.group
    @schedules = Schedule.where(plan_id: @plan.id)
    @plan.day_hows.each do |day_how| 
      @passed = day_how.passed
      @day_schedules = day_how.schedules
      @day_id = day_how.id
    end
  end
  
  def create
    @schedule = Schedule.create( 
      hour_id: schedule_params[:hour_id],
      minute_id: schedule_params[:minute_id],
      program: schedule_params[:program], 
      category_id: schedule_params[:category_id], 
      plan_id: schedule_params[:format], 
      user_id: schedule_params[:user_id], 
      day_how_id: schedule_params[:day_id]
    )
  end
  
  def edit
    plan = @schedule.plan
    @plan_id = plan.id
  end
  
  def update
    @schedule = Schedule.find_by(id: params[:id]) 
    @schedule.update(id: schedule_params[:id], 
      hour_id: schedule_params[:hour_id],
      minute_id: schedule_params[:minute_id],
      program: schedule_params[:program],
      category_id: schedule_params[:category_id],
      plan_id: schedule_params[:format],
      user_id: schedule_params[:user_id],
      day_how_id: schedule_params[:day_how_id]
    )
  end
  
  def destroy
    @schedule.destroy
  end
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:hour_id, :minute_id, :program, :category_id, :format, :day_id).merge(user_id: current_user.id)
    #formatはPlanのid
  end
  
  def move_to_new
    plan = Plan.find_by(plan_id: params[:plan_id])
    @schedules = plan.schedules.includes(:group)
    unless @schedules
      render :new
    end 
  end
  
  def find_schedule
    @schedule = Schedule.find(params[:id])    
  end
end
