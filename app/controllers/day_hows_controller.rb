class DayHowsController < ApplicationController
  def new
    @day = DayHow.new
    @plan = Plan.find_by(id: params[:format])
    @plan_id = @plan.id 
  end

  def create
    if DayHow.find_by(day: 1).present?
      @day = DayHow.where(day: 1, plan_id: day_how_params[:format])
    else
      @day = DayHow.create(day: 1, plan_id: day_how_params[:format])
    end
    if @day.valid?
      @day.save
    else
    end
  end

  private
  def day_how_params
    params.permit(:day, :format).merge(user_id: current_user.id)
  end
end
