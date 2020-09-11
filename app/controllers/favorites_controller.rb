class FavoritesController < ApplicationController
  before_action :find_group_candidate, only: [:create, :destroy]
  def create
    favorite = current_user.favorites.build(candidate_id: params[:candidate_id])
    favorite.save
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, candidate_id: params[:candidate_id])
    favorite.destroy
  end
  
  private 
  def find_group_candidate
    @group = Group.find(params[:group_id])
    @candidate = Candidate.find(params[:candidate_id])
  end
end
