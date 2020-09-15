class DiariesController < ApplicationController
  before_action :find_user_memory
  before_action :find_diary,          only: [:show, :edit, :update, :destroy]
  def index 
    @diaries = Diary.where(memory_id: @memory.id).order(specific: :asc)
  end

  def new
    @diary = Diary.new
  end

  def  create
    diary = Diary.new(diary_params)
    if diary.save
      redirect_to group_memory_diary_path(@group, @memory, @diary)
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @diary.update(diary_params)
      redirect_to group_memory_diary_path(@group, @memory, @diary)
    else
      render :edit
    end
  end
  
  def destroy
    @diary.destroy
    redirect_to group_memory_diaries_path(@group, @memory, @diary)
  end
  
  private 
  def diary_params
    params.require(:diary).permit(:specific, :title, :content).merge(user_id: current_user.id, memory_id: params[:memory_id])
  end
  
  def find_user_memory
    @user = current_user
    @memory = Memory.find(params[:memory_id])
    @group = @memory.group
  end
  def find_diary
    @diary = Diary.find(params[:id])
  end
end
