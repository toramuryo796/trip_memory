class CandidatesController < ApplicationController
before_action :find_group, only: [:index, :new, :create]

  def index
    @candidates = @group.candidates.all.order("created_at ASC").includes(:user)
    @count = 1
  end

  def new 
    @candidate = Candidate.new
  end
  
  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to group_candidates_path(@group, @candidate)
    else
      render :new
    end
  end
  
  private
  def candidate_params
    params.permit(:budget_id, :night, :destination, :reason, :transportation_id, :take_time, :trans_cost, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
  
  def find_group
    @group = Group.find_by(id: params[:group_id])
  end

end
