class PlansController < ApplicationController
  before_action :find_group
  before_action :find_candidate,   only: [:index,:new]
  before_action :find_plan,        only: [:edit, :update]
  
  def new
    @group = Group.find_by(id: params[:group_id]) 
    @candidate = Candidate.find_by(id: params[:candidate_id])
    if @candidate
      @candidate_id = @candidate.id
    end
    @plan = Plan.new()
  end

  def create
    # day_howモデルとのformオブジェクトで一括登録
    @plan = DayHowPlans.new(create_plan)
    @group = Group.find_by(id: create_plan[:group_id])

    if @plan.valid?
      @plan.save
      redirect_to group_plans_path(@group, @plan)
    else
      render :new
    end
  end

  def index
    @group = Group.find_by(id: params[:group_id])
    @plans = Plan.where(group_id: @group.id).order('created_at DESC')
  end

  def edit
    @group = Group.find_by(id: params[:group_id])
  end

  def update
    if @plan.update(plan_params)
      redirect_to group_plans_path(@group, @plan)
    else
      render :edit
    end
  end

  def destroy
    @plan = Plan.find_by(id: params[:id])
    @plan.destroy
    redirect_to group_plans_path(@group, @plan)
  end
  
  def show
    @plan = Plan.find_by(id: params[:id])
    @group = @plan.group
  end
  
  private 
  def plan_params
    params.permit(:title, :destination, :departure_day, :return_day, :hotel, :hotel_memo, :transportation_id, :ticket, :start_place, :candidate_id).merge(group_id: params[:group_id], user_id: current_user.id)
  end
  
  def create_plan
    params.permit(:title, :destination, :departure_day, :return_day, :hotel, :hotel_memo, :transportation_id, :ticket, :start_place, :group_id, :candidate_id).merge(user_id: current_user.id)
  end
  
  def find_group
    @group = Group.find_by(id: params[:id])
    unless @group.present?
      @group = Plan.find_by(id: params[:group_id])
    end
    @user = current_user
  end
    
  def find_candidate
      @candidate = Candidate.find_by(id: params[:candidate_id])
  end
    
  def find_plan
      @plan = Plan.find_by(id: params[:id])
  end
end
  