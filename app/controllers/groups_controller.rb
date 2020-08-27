class GroupsController < ApplicationController
  before_action :move_to_index, only: :index
  def index
    @group = Group.new
  end

  def new
    @group = Group.new
  end
  
  def create
    @group = Group.create(name: group_params[:name])
    # 入力されたメンバー情報をmembers変数に代入
    members = []
    group_params[:members].each do |member|
      if member && member != ""
        members << member
      end
    end
    @user = nil
    @user_group = nil 
    count = 0

    members.each do |member|
      #paramsで送られてきたユーザーを一つずつ取得
      @user = User.find_by(nickname: member)
      #中間テーブルに上のuserとgroupを紐付けて保存
      @user_group = UserGroup.new(group_id: @group.id, user_id: @user.id) 
      # ユーザーが全員登録できればcountされていく
      if @user_group.save
        count += 1
      end
    end

    if count == members.length
      redirect_to group_path(@group)
    else
      redirect_to :new
    end

  end
  
  def show
    @group = Group.find(params[:id])
  end
  
  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to root_path  
  end

  private
  def group_params
    params.require(:group).permit(:commit, :name, members:[]).merge(user_id: current_user.id)
  end

  def move_to_index
    if user_signed_in? == false
      redirect_to new_user_session_path
    end
  end
end
