class DictionariesController < ApplicationController
  before_action :find_dictionary, only: [:edit, :update, :destroy]

  def index
    @dictionary = Dictionary.new
    @group = Group.find(params[:group_id])
    @user = current_user
    @plan = Plan.find(params[:plan_id])
    @dictionaries = @plan.dictionaries.order("japanese ASC").includes(:plan)
    if @dictionaries
      @dictionaries.each do |dic|
        @language = dic.language
      end
    end
  end

  def create
    @dictionary = Dictionary.create(dictionary_params)
    @group = @dictionary.group
    @plan = @dictionary.plan
    binding.pry
  end
  
  def edit
    @plan = @dictionary.plan
    @group = @plan.group
  end
  
  def update
    @dictionary.update(dictionary_params)
    @plan = @dictionary.plan
    @group = @plan.group
  end
  
  def destroy
    @dictionary.destroy
  end

  private
  def dictionary_params
    params.require(:dictionary).permit(:language, :japanese, :translation).merge(plan_id: params[:plan_id], user_id: current_user.id, group_id: params[:group_id])
  end
  
  def find_dictionary
    @dictionary = Dictionary.find(params[:id])
  end
end
