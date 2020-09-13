class ChecksController < ApplicationController
  before_action :find_user_bring, only: [:create, :destroy]
  def create
    @check = current_user.checks.build(bring_id: params[:bring_id])
    @check.save
  end
  
  def destroy
    @check = Check.find_by(user_id: current_user.id, bring_id: params[:bring_id])
    @check.destroy
  end
  
  private

  def find_user_bring
    @user = current_user
    @bring = Bring.find(params[:bring_id])
    @plan = @bring.plan
    @group = @bring.group
  end
end
