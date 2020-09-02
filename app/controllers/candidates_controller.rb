class CandidatesController < ApplicationController
before_action :find_group, only: [:index, :new, :create, :edit, :destroy]
before_action :find_candidate, only: [:index, :edit,:update, :destroy]

  def index
    @candidates = @group.candidates.includes(:user).order("created_at ASC")
    @count = 1
    # 行きたいカウント
    if @candidate
      @good = Good.new
    end
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

  def edit
  end
  
  def update
    if @candidate.update(edit_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    redirect_to  group_candidates_path(@group, @candidate)
  end
  
  private
  def candidate_params
    params.permit(:budget_id, :night, :destination, :reason, :transportation_id, :take_time, :trans_cost, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
  
  def edit_params
    params.require(:group).permit(:budget_id, :night, :destination, :reason, :transportation_id, :take_time, :trans_cost, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
  
  def find_group
    @group = Group.find_by(id: params[:group_id])
  end
  
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end
