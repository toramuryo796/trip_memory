class GoodsController < ApplicationController
  def create 
    binding.pry
    @good = Good.create(user_id: current_user.id, candidate_id: params[:candidate_id])
  end
end
private