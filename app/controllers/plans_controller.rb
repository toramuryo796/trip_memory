class PlansController < ApplicationController
  before_action :find_group,       only: [:index,:new, :create, :edit, :destroy, :update]
  before_action :find_candidate,   only: [:index,:new]
  before_action :find_plan,        only: [:edit, :update, :destroy]
  
  def new
    @candidate = Candidate.find_by(id: params[:format])
    @plan = Plan.new()
  end

  def create
    plan = DayHowPlans.new(plan_params)
    if plan.valid?
      plan.save
      redirect_to group_plans_path(@group, @plan)
    else
      render :new
    end
  end

  def index
    @group = Group.find_by(params[:group_id])
    @plans = Plan.includes(:user).order('created_at DESC')
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to group_plans_path(@group, @plan)
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
    redirect_to group_plans_path(@group, @plan)
  end

  private 
  def plan_params
    params.permit(:title, :destination, :departure_day, :return_day, :hotel, :hotel_memo, :transportation_id, :ticket, :start_place).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def find_group
    @group = Group.find_by(id: params[:id])
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:candidate_id])
  end

  def find_plan
    @plan = Plan.find_by(id: params[:id])
  end
end
