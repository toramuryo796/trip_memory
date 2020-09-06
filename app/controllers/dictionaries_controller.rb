class DictionariesController < ApplicationController
  before_action :find_dictionary, only: [:edit, :update]

  def index
    @dictionaries = Dictionary.all.order("translation ASC").includes(:plan)
    @dictionary = Dictionary.new
    @group = Group.find(params[:group_id])
    @plan = Plan.find(params[:plan_id])
    if @dictionaries
      @dictionaries.each do |dic|
        @language = dic.language
      end
    end
  end

  def create
    @dictionary = Dictionary.create(dictionary_params)
  end

  def edit
  end
  
  def update
    @dictionary.update(dictionary_params)
  end
  
  private
  def dictionary_params
    params.require(:dictionary).permit(:language, :japanese, :translation).merge(plan_id: params[:plan_id], user_id: current_user.id, group_id: params[:group_id])
  end
  
  def find_dictionary
    @dictionary = Dictionary.find(params[:id])
  end
end
