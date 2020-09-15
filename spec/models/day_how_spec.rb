require 'rails_helper'

RSpec.describe DayHow, type: :model do
  describe "スケジュール日程" do
    before do
      @day_how = FactoryBot.build(:day_how)
    end
    it "全て正しく禁輸できていたら登録できる" do
      expect(@day_how).to be_valid
    end

    it "日が空だと登録できない" do
      @day_how.passed = ""
      @day_how.valid?
      expect(@day_how.errors.full_messages).to include("日を入力してください", "日は半角数字で入力してください")
    end
    
    it "日がひらがなだと登録できない" do
      @day_how.passed = "あいう"
      @day_how.valid?
      expect(@day_how.errors.full_messages).to include("日は半角数字で入力してください")
    end

    it "日がカタカナだと登録できない" do
      @day_how.passed = "アイウ"
      @day_how.valid?
      expect(@day_how.errors.full_messages).to include("日は半角数字で入力してください")
    end

    it "日が半角英字だと登録できない" do
      @day_how.passed = "abc"
      @day_how.valid?
      expect(@day_how.errors.full_messages).to include("日は半角数字で入力してください")
    end

  end
end
