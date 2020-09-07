class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:edit, :destroy]
  
  def new
    @schedule = Schedule.find_by(id: params[:id])    
    @plan = @schedule.plan
    @plan_id = @plan.id
    @group = @plan.group
  end
  
  def index
    if params[:day_how_passed]
      @plan = Plan.find_by(id: other_schedule[:plan_id])
      @plan_id = @plan.id                                # plan_idを取得
      @day_how = DayHow.find_by(passed: other_schedule[:day_how_passed])
      @day_how_first = DayHow.find_by(passed: other_schedule[:day_how_passed])
      @schedules = Schedule.where(plan_id: @plan_id, day_how_id: @day_how.id).order("hour_id ASC")  # 日程に該当するのスケジュールを特定
      @passed = @day_how.passed
    else
      @plan = Plan.find_by(id: first_params[:plan_id])
      @plan_id = @plan.id                                # plan_idを取得
      @day_how_first = DayHow.find_by(passed: 1, plan_id: @plan_id)
      @schedules = Schedule.where(plan_id: @plan_id, day_how_id: @day_how_first.id)  # 日程に該当するのスケジュールを特定
      @passed = @day_how_first.passed
    end
    binding.pry
    
    @other_days = DayHow.where(plan_id: @plan.id).select(:plan_id, :passed).distinct.order("passed ASC")        # palnのday_howを特定
    @other_days.each do |day_how|                        # 日にち毎の各カラム値を取得する
      # @passed = day_how.passed
      @day_schedules = day_how.schedules
      @day_id = day_how.id
    end
    @group = @plan.group.id                                # planのグループを特定
    # @schedules = Schedule.where(plan_id: plan_id )     # planのスケジュールを特定
  end
  
  def create
    @schedule = Schedule.create(schedule_params)  
    @plan = @schedule.plan
    @group = @plan.group

  end
  
  def edit
    plan = @schedule.plan                              
    @plan_id = plan.id
  end
  
  def update
    @schedule = Schedule.find_by(id: params[:id])       
    @schedule.update(schedule_params)
    plan = @schedule.plan                              
    @plan_id = plan.id
  end
  
  def destroy
    @schedule.destroy
  end
  
  private
  #他ページから遷移してきた時  
  def first_params
    params.permit(:hour_id, :minute_id, :program, :category_id, :plan_id, :day_how_id).merge(user_id: current_user.id)
    #formatはPlanのid
  end

  #スケジュールを作成/編集時
  def schedule_params
    params.require(:schedule).permit(:hour_id, :minute_id, :program, :category_id, :plan_id, :day_how_id).merge(user_id: current_user.id)
    #formatはPlanのid
  end

  # 他日にちリンクを押した時
  def other_schedule
    params.permit(:day_how_passed, :plan_id).merge(user_id: current_user.id)
  end
  
  
  def find_schedule
    @schedule = Schedule.find(params[:id])    
  end
end
