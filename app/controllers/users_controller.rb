class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @candidates = @user.candidates
    @groups = @user.groups
  end
end
