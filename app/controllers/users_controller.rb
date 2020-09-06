class UsersController < ApplicationController
  before_action :move_to_login
  before_action :move_making_group, eexcept: [:move_to_login]
  def show
    @user = current_user
    @groups = @user.groups
    @plans = @user.plans
    @dictionaries = @user.dictionaries
    @candidates = @user.candidates
    @memories = @user.memories
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

  def journal
    @user = current_user
    @plans = @user.plans
    @group = @user.groups
  end

  private

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_making_group
    unless current_user.groups.present?
        redirect_to new_group_path
    end
  end
end
