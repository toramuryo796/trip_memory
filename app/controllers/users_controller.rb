class UsersController < ApplicationController
  def show
    @user = current_user
    @groups = @user.groups
    @plans = @user.plans
    @dictionaries = @user.dictionaries
    @candidates = @user.candidates
  end

  def candidates
    @user = current_user
    @candidates = @user.candidates
    @groups = @user.groups
  end
  
  def plans
    @user = current_user
    @candidates = @user.candidates
    @groups = @user.groups
    @plans = @user.plans
  end
end
