class GroupsController < ApplicationController
  before_action :move_to_index

  def index
    @group = Group.new
  end

  def new
    @group = Group.new
  end

  def create
    user_ids = []
    # user_ids[]には入力されたユーザー名が入っているため、idに直す
    if group_params[:user_ids] # ユーザー名が記入されているか
      group_params[:user_ids].each do |user| # 入力されたユーザー名を１つずつ見ていく
        if User.find_by(user_ID: user) # 入力されたユーザーが登録されているものか
          user = User.find_by(user_ID: user)    # userに記入されたユーザーの情報を代入
          user_id = user.id                      # userのidを取得
          user_ids << user_id                    # user_ids配列に入れていく
        end
      end
    end
    # user_idsにいくつ入っているか、重複ユーザーが入っていないか
    count_box = []
    count = 0
    user_ids.each do |user_id| # user_idsの中身を一つ一つ見ていく
      if count_box.length == 0 # count_boxの中身が何もないとき(1順目)は配列に入れる
        count_box << user_id                     # count_box配列に入れていく
        count += 1                               # countに1加算
      else
        count_box.each do |num| # count_boxの中身があるときに一つずつ見ていく
          unless num == user_id # count_boxの中身の数字とuser_idsの中身の数字が違う場合
            count_box << user_id                 # count_box配列に入れていく
            count += 1                           # countに1を加算
          end
        end
      end
    end
    #重複していないユーザーが2人以上いるときに保存する
    if count >= 2 # グループのメンバーが2人以上いるとき
      @group = Group.new(name: group_params[:name])                             # グループを生成
      if @group.save # グループが保存できたとき
        user_ids.each do |user_id| # user_ids配列の中身を1つずつ見ていく
          if User.find_by(id: user_id) # 登録されているユーザーか
            UserGroup.create(user_id: user_id, group_id: @group.id)       # UserGroupを作成
          end
        end
        redirect_to group_path(@group)
      else
        redirect_to new_group_path
      end
    else
      redirect_to new_group_path
    end
  end

  def show
    @group = Group.find_by(params[:group_id])
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def move_to_index
    if user_signed_in? == false
      redirect_to new_user_session_path
    end
  end
end
