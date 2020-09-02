class GoodsController < ApplicationController
  def create 
    @good = current_user.goods.create(candidate_id: params[:candidate_id])
    @candidate = @good.candidate
    @group = @candidate.group
    render json:{post: @good}
    # redirect_to group_candidates_path(@group, @candidate)
  end
  
  def destroy
    @good = Good.find_by(candidate_id: params[:candidate_id], user_id: current_user.id)
    @good.destroy
    @candidate = @good.candidate
    @group = @candidate.group
    render json:{post: @good}
    # redirect_to group_candidates_path(@group, @candidate)
  end
end
private