class PlansController < ApplicationController
  before_action :find_group,       only: [:new]
  before_action :find_candidate,   only: [:new]

  def new
    @plan = Plan.new
  end

  def create
  end

  private 
  def plan_params
  end

  def find_group
    @group = Group.find_by(id: params[:id])
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end
