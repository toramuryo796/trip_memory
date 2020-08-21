class GroupsController < ApplicationController
  def index
    @groups = Group.all.order("name DESC")
  end

  def new
  end

  def create
  end

  def show
  end
end
