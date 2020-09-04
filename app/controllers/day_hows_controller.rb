class DayHowsController < ApplicationController
  def index
    @group = Group.find(params[:id])
    @days = DayHow.all.includes(:group)
  end 

  def new
    @day_how = DayHow.new
    @plan = Plan.find_by(id: params[:format])         #formatにはplanのidが入っている
  end

  def create
    @plan = Plan.find_by(id: create_day_how[:format])
    day_how = DayHow.new(passed: create_day_how[:passed],
      plan_id: create_day_how[:format],
      user_id: create_day_how[:user_id]
    )
    if day_how != @plan.day_hows                # すでに取得している日程じゃないか確認
      if day_how.save
        redirect_to schedules_path(@plan.id)
      else
        render :new
      end
    else
      render :new
    end
  end

  private
  def day_how_params
    params.permit(:passed, :format).merge(user_id: current_user.id)
  end
  
  def create_day_how
    params.require(:day_how).permit(:passed, :format).merge(user_id: current_user.id)
  end
end
