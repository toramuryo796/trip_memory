class CandidatesController < ApplicationController
  def new 
    @group = Group.find_by(id: params[:group_id])
    @candidate = Candidate.new
  end

  def create
  end
end
