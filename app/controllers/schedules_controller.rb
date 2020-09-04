class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:edit, :destroy]

  def new
  end
  
  def index
    @plan = Plan.find(params[:format])                 # 計画を特定
    @plan_id = @plan.id                                # plan_idを取得
    @other_days = DayHow.where(plan_id: @plan.id)      # palnのday_howを特定
    @group = @plan.group                               # planのグループを特定
    @schedules = Schedule.where(plan_id: @plan.id)     # planのスケジュールを特定
    @other_days.each do |day_how|                      # 日にち毎の各カラム値を取得する
      @passed = day_how.passed
      @day_schedules = day_how.schedules
      @day_id = day_how.id
    end
  end
  
  def create
    @schedule = Schedule.create(                       # paln画面からplan_idをformatで送ってもらっているため←の書き方
      hour_id: schedule_params[:hour_id],
      minute_id: schedule_params[:minute_id],
      program: schedule_params[:program], 
      category_id: schedule_params[:category_id], 
      plan_id: schedule_params[:format],               #
      user_id: schedule_params[:user_id], 
      day_how_id: schedule_params[:day_id]
    )
  end
  
  def edit
    plan = @schedule.plan                              
    @plan_id = plan.id
  end
  
  def update
    @schedule = Schedule.find_by(id: params[:id])       #formatをしようしているため、←の書き方
    @schedule.update(id: schedule_params[:id], 
      hour_id: schedule_params[:hour_id],
      minute_id: schedule_params[:minute_id],
      program: schedule_params[:program],
      category_id: schedule_params[:category_id],
      plan_id: schedule_params[:format],
      user_id: schedule_params[:user_id],
      day_how_id: schedule_params[:day_how_id]
    )
    plan = @schedule.plan                              
    @plan_id = plan.id
  end
  
  def destroy
    @schedule.destroy
  end
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:hour_id, :minute_id, :program, :category_id, :format, :day_id).merge(user_id: current_user.id)
    #formatはPlanのid
  end
  
  def find_schedule
    @schedule = Schedule.find(params[:id])    
  end
end
