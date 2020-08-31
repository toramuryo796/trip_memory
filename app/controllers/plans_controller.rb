class PlansController < ApplicationController
  before_action :find_group,       only: [:new, :create]
  before_action :find_candidate,   only: [:new]

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

  private 
  def plan_params
    params.require(:group).permit(:title, :departure_day, :return_day, :hotel, :hotel_memo, :transportation_id, :ticket).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:candidate_id])
  end
end
