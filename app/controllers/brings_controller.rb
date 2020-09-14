class BringsController < ApplicationController
  before_action :find_user_group
  def index
    @brings = @plan.brings
  end
  
  def new
    @bring = Bring.find_by(id: params[:id])
  end
  
  def create
    @bring = Bring.new(bring_params)
    unless @bring.thing == ""
      @bring.save
    else
      render :index
    end
  end
  
  def edit
    @bring = Bring.find(params[:id])
  end

  def update
    @bring = Bring.find(params[:id])
    @bring.update(bring_params)
  end

  def destroy
    @bring = Bring.find(params[:id])
    @bring.destroy
  end

  private
  def bring_params
    params.require(:bring).permit(:thing).merge(group_id: params[:group_id], plan_id: params[:plan_id], user_id: current_user.id)
  end
  
  def find_user_group
    @user = current_user 
    @group = Group.find_by(id: params[:group_id])
    @plan = Plan.find_by(id: params[:plan_id])
  end
end
