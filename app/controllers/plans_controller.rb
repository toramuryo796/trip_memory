class PlansController < ApplicationController
  before_action :find_group,       only: [:index,:new, :create]
  before_action :find_candidate,   only: [:index,:new]
  
  def new
    @plan = Plan.new()
  end

  def create
    plan = Plan.new(plan_params)
    if plan.save
      redirect_to group_plans_path(@group, @plan)
    else
      render :new
    end
  end

  def index
    @plans = Plan.includes(:user).order('created_at DESC')
  end

  private 
  def plan_params
    params.require(:group).permit(:title, :destination, :departure_day, :return_day, :hotel, :hotel_memo, :transportation_id, :ticket, :start_place).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:candidate_id])
  end
end
