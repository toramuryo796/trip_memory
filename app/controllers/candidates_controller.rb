class CandidatesController < ApplicationController
before_action :find_user_group
before_action :find_candidate, only: [:index, :edit,:update, :destroy, :show]
before_action :for_header, only: [:index, :new, :edit, :show]

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
      redirect_to group_candidates_path(@group, @candidate)
    else
      render :edit
    end
  end
  
  def destroy
    @candidate.destroy
    redirect_to  group_candidates_path(@group, @candidate)
  end
  
  def show
    @group = @candidate.group
  end
  
  private
  def candidate_params
    params.permit(:budget_id, :night, :destination, :reason, :transportation_id, :take_time, :trans_cost, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
  
  def edit_params
    params.require(:group).permit(:budget_id, :night, :destination, :reason, :transportation_id, :take_time, :trans_cost, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
  
  def find_user_group
    @user = current_user
    @group = Group.find_by(id: params[:group_id])
  end
  
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
  
  def for_header  
    #hewder用
    @plans = @group.plans
    @plans.each do |plan|
      @plan = plan
    end
    @memories = @group.memories
    @memories.each do |memory|
      @pmemory = memory
    end
    @candidates = @group.candidates
  end
end