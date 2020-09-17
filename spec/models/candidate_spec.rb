require 'rails_helper'

RSpec.describe Candidate, type: :model do
  describe "行き先候補" do 
    before do 
      @candidate = FactoryBot.build(:candidate)
    end
    it "全ての記入事項が正しく記入できていれば登録できる" do
      expect(@candidate).to be_valid
    end
    
    it "予算が空だと登録できない" do
      @candidate.budget_id = nil
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("予算を入力してください")
    end
    
    it "日数が空だと登録できない" do
      @candidate.night = nil
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("日数を入力してください")    
    end

    it "行き先が空だと登録できない" do
      @candidate.destination = nil
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("行き先を入力してください")      
    end

    it "行き先が41字以上だと登録できない" do
      @candidate.destination = Faker::Lorem.characters(number: 41)
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("行き先は40字以内で記入してください")      
    end

    it "理由が401字以上だと登録できない" do
      @candidate.reason = Faker::Lorem.characters(number: 401)
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("理由は400字以内で記入してください")      
    end

    it "移動時間がひらがなだと登録できない" do
      @candidate.take_time = "あいう"
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("移動時間は半角数字で入力してください")     
    end
    it "移動時間がカタカナだと登録できない" do
      @candidate.take_time = "アイウエオ"
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("移動時間は半角数字で入力してください")     
    end
    it "移動時間が半角英字だと登録できない" do
      @candidate.take_time = "abc"
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("移動時間は半角数字で入力してください")     
    end

    it "交通費がひらがなだと登録できない" do
      @candidate.trans_cost = "あいう"
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("交通費は半角数字で入力してください")      
    end
    
    it "交通費がカタカナだと登録できない" do
      @candidate.trans_cost = "アイウエオ"
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("交通費は半角数字で入力してください")      
    end
    
    it "交通費が半角英字だと登録できない" do
      @candidate.trans_cost = "abc"
      @candidate.valid?
      expect(@candidate.errors.full_messages).to include("交通費は半角数字で入力してください")      
    end
  end
end
