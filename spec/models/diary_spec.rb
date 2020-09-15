require 'rails_helper'

RSpec.describe Diary, type: :model do
  describe "日記" do
    before do
      @diary = FactoryBot.build(:diary)
    end
    it "全て正しく記入できれば登録できる" do
      expect(@diary).to be_valid
    end

    it "日がなければ登録できない" do
      @diary.specific = nil
      @diary.valid?
      expect(@diary.errors.full_messages).to include("日を入力してください", "日は数値で入力してください")
    end

    it "日がひらがなだと登録できない" do
      @diary.specific = "あいうえお"
      @diary.valid?
      expect(@diary.errors.full_messages).to include("日は数値で入力してください")
    end

    it "日がカタカナだと登録できない" do
      @diary.specific = "アイウエオ"
      @diary.valid?
      expect(@diary.errors.full_messages).to include("日は数値で入力してください")
    end
    
    it "日が半角英字だと登録できない" do
      @diary.specific = "abc"
      @diary.valid?
      expect(@diary.errors.full_messages).to include("日は数値で入力してください")
    end

    it "タイトルが空だと登録できない" do
      @diary.title = nil
      @diary.valid?
      expect(@diary.errors.full_messages).to include("タイトルを入力してください")
    end

    it "タイトルが41字以上だと登録できない" do
      @diary.title = Faker::Lorem.characters(number: 41)
      @diary.valid?
      expect(@diary.errors.full_messages).to include("タイトルは40字以内で記入してください")
    end

    it "内容が空だと登録できない" do
      @diary.content = nil
      @diary.valid?
      expect(@diary.errors.full_messages).to include("内容を入力してください")
    end

    it "内容が1001字以上だと登録できない" do
      @diary.content = Faker::Lorem.characters(number: 10001)
      @diary.valid?
      expect(@diary.errors.full_messages).to include("内容は1000字以内で記入してください")
    end
  end
end
