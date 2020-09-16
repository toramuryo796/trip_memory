class DayHowsController < ApplicationController
  before_action :find_user, only: :new
  def index
    @group = Group.find(params[:id])
    @days = DayHow.all.includes(:group)
  end 

  def new
    @day_how = DayHow.new
    @plan = Plan.find_by(id: day_how_params[:plan_id])                                        #formatにはplanのidが入っている
    @plan_id = @plan.id
  end

  def create
    plan = Plan.find_by(id: create_day_how[:plan_id])
    day_how = DayHow.new(passed: create_day_how[:passed],
      plan_id: create_day_how[:plan_id],
      user_id: create_day_how[:user_id]
    )
    exsist_day_hows = DayHow.where(plan_id: plan.id).select(:plan_id, :passed).distinct
    count = 0
    # すでに取得している日程じゃないか確認して保存
    exsist_day_hows.each do |day|
      if day.passed == day_how.passed                                                           # すでにある日にちだとcountが加算される      
        count += 1
      end
    end
    if count < 1                                                                                 #countに加算されていれば、同じ日付があるということなので、保存できない
      if day_how.save
        redirect_to schedules_path(day_how_passed: day_how.passed, plan_id: plan.id)
      else
        redirect_to new_day_how_path(plan_id: plan.id)
      end
    else
      redirect_to new_day_how_path(plan_id: plan.id)
    end
  end

  private
  def day_how_params
    params.permit(:passed, :plan_id).merge(user_id: current_user.id)
  end
  
  def create_day_how
    params.require(:day_how).permit(:passed, :plan_id).merge(user_id: current_user.id)
  end

  def find_user
    @user = current_user
  end
end
