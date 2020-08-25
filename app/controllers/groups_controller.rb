class GroupsController < ApplicationController
  def index
    @groups = Group.all.order("name DESC")
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
      unless member
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
  
  private
  def group_params
    params.require(:group).permit(:commit, :name, members:[]).merge(user_id: current_user.id)
  end
end
