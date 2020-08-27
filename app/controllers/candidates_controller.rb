class CandidatesController < ApplicationController
  def new
    @group = Group.find(params[:id])
    @candidate = Candidate.new
  end
end
