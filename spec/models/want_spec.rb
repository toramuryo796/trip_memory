require 'rails_helper'

RSpec.describe Want, type: :model do
  describe "やりたい事リスト" do
    before do
      @want = FactoryBot.build(:want)
    end
    it "全て正しく記入できていれば登録できる" do
      expect(@want).to be_valid
    end

    it "優先度を選択していなければ登録できない" do
      @want.priority_id = nil
      @want.valid?
      expect(@want.errors.full_messages).to include("優先度を入力してください")
    end

    it "やりたい事が空だと登録できない" do
      @want.program = nil
      @want.valid?
      expect(@want.errors.full_messages).to include("やりたいことを入力してください")
    end

    it "やりたい事が41字以上だと登録できない" do
      @want.program = Faker::Lorem.characters(number: 41)
      @want.valid?
      expect(@want.errors.full_messages).to include("やりたいことは40字以内で記入してください")
    end
  end
end
