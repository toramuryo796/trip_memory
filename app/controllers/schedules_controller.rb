class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:edit, :destroy]

  def new
  end
  
  def index
      @plan = Plan.find_by(id: first_params[:plan_id])
      @plan_id = @plan.id                                # plan_idを取得
      @schedules = Schedule.where(plan_id: @plan_id)  # 日程に該当するのスケジュールを特定
      @other_days = DayHow.where(plan_id: @plan.id).select(:plan_id, :passed).distinct.order("passed ASC")        # palnのday_howを特定
      @other_days.each do |day_how|                        # 日にち毎の各カラム値を取得する
        @passed = day_how.passed
        @day_schedules = day_how.schedules
        @day_id = day_how.id
      end
    @group = @plan.group                                 # planのグループを特定
    # @schedules = Schedule.where(plan_id: plan_id )     # planのスケジュールを特定
  end
  
  def create
    @schedule = Schedule.create(schedule_params)          
  end
  
  def edit
    plan = @schedule.plan                              
    @plan_id = plan.id
  end
  
  def update
    @schedule = Schedule.find_by(id: params[:id])       #formatをしようしているため、←の書き方
    @schedule.update(schedule_params)
    plan = @schedule.plan                              
    @plan_id = plan.id
    binding.pry
  end
  
  def destroy
    @schedule.destroy
  end
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:hour_id, :minute_id, :program, :category_id, :plan_id, :day_how_id).merge(user_id: current_user.id)
    #formatはPlanのid
  end
  def first_params
    params.permit(:hour_id, :minute_id, :program, :category_id, :plan_id, :day_how_id).merge(user_id: current_user.id)
    #formatはPlanのid
  end
  
  
  def find_schedule
    @schedule = Schedule.find(params[:id])    
  end
end
