class GroupsController < ApplicationController
  def index
    @groups = Group.all.order("name DESC")
    @group = Group.new
  end

  def new
  end

  def create
  end

  def show
  end



end
