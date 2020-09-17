require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe "旅行計画" do
    before do
      @plan = FactoryBot.build(:plan)
    end    

    it "全て正しく記入したら登録できる" do
      expect(@plan).to be_valid
    end

    it "タイトルが空だと登録できない" do
      @plan.title = nil 
      @plan.valid?
      expect(@plan.errors.full_messages).to include("タイトルを入力してください")
    end

    it "タイトルが41字以上だと登録できない" do
      @plan.title = Faker::Lorem.characters(number: 41)
      @plan.valid?
      expect(@plan.errors.full_messages).to include("タイトルは40字以内で記入してください")
    end 

    it "行き先が空だと登録できない" do
      @plan.destination = nil 
      @plan.valid?
      expect(@plan.errors.full_messages).to include("行き先を入力してください")
    end 

    it "行き先が41字以上だと登録できない" do
      @plan.destination =  Faker::Lorem.characters(number: 41)
      @plan.valid?
      expect(@plan.errors.full_messages).to include("行き先は40字以内で記入してください")
    end 

    it "ホテル名が41字以上だと登録できない" do
      @plan.hotel =  Faker::Lorem.characters(number: 41)
      @plan.valid?
      expect(@plan.errors.full_messages).to include("ホテル名は40字以内で記入してください")
    end 

    it "ホテル情報が401文字以上だと登録できない" do
      @plan.hotel_memo =  Faker::Lorem.characters(number: 401)
      @plan.valid?
      expect(@plan.errors.full_messages).to include("ホテル情報は400字以内で記入してください")
    end 

    it "交通機関情報が401字以上だと登録できない" do
      @plan.ticket = Faker::Lorem.characters(number:401)
      @plan.valid?
      expect(@plan.errors.full_messages).to include("交通機関情報は400字以内で記入してください")
    end 

    it "出発地点が40字以上だと登録できない" do
      @plan.start_place = Faker::Lorem.characters(number:41)
      @plan.valid?
      expect(@plan.errors.full_messages).to include("出発地は40字以内で記入してください")
    end 
  end
end
