class GoodsController < ApplicationController
  def create 
    @good = current_user.goods.create(candidate_id: params[:candidate_id])
    @candidate = @good.candidate
    @group = @candidate.group
    redirect_to group_candidates_path(@group, @candidate)
  end

  def destroy
    @good = Good.find_by(candidate_id: params[:candidate_id], user_id: current_user.id)
    @candidate = @good.candidate
    @group = @candidate.group
    @good.destroy
    redirect_to group_candidates_path(@group, @candidate)
  end
end
private