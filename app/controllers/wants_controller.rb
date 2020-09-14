class WantsController < ApplicationController
  before_action :find_user_plan
  before_action :find_want,     only: [:edit, :update, :destroy]
  def index
    @wants = @plan.wants.order("priority_id ASC")
    @want = Want.find_by(id: params[:id])
  end

  def new 
    @want = Want.find_by(id: params[:id])
  end 

  def create
    @want = Want.new(want_params)
    unless @want.save
      render :index
    end
  end

  def edit
  end
  
  def update
    @want.update(want_params)
  end
  
  def destroy
    @want.destroy
  end
  
  private
  def want_params
    params.require(:want).permit(:priority_id, :program).merge(plan_id: params[:plan_id])
  end
  
  def find_user_plan
    @user = current_user
    @plan = Plan.find(params[:plan_id])
    @group = Group.find(params[:group_id])
  end
  
  def find_want
    @want = Want.find(params[:id])
  end

end
