require 'rails_helper'

RSpec.describe Memory, type: :model do
  describe "思い出" do
    before do
      @memory = FactoryBot.build(:memory)
    end
    it "全て正しく記入できていれば登録できる" do
      expect(@memory).to be_valid
    end

    it "タイトルが空だと登録できない" do
      @memory.title = nil
      @memory.valid?
      expect(@memory.errors.full_messages).to include("タイトルを入力してください")
    end

    it "タイトルが41字以上だと登録できない" do
      @memory.title = Faker::Lorem.characters(number: 41) 
      @memory.valid?
      expect(@memory.errors.full_messages).to include("タイトルは40字以内で記入してください")
    end

    it "行き先が空だと登録できない" do
      @memory.destination = nil
      @memory.valid?
      expect(@memory.errors.full_messages).to include("行き先を入力してください")
    end

    it "行き先が41字以上だと登録できない" do
      @memory.destination = Faker::Lorem.characters(number: 41)  
      @memory.valid?
      expect(@memory.errors.full_messages).to include("行き先は40字以内で記入してください")
    end

    it "出発日が空だと登録できない" do
      @memory.departure_day = nil 
      @memory.valid?
      expect(@memory.errors.full_messages).to include("出発日を入力してください")
    end

    it "帰着日が空だと登録できない" do
      @memory.return_day = nil 
      @memory.valid?
      expect(@memory.errors.full_messages).to include("帰着日を入力してください")
    end

    it "移動手段が空だと登録できない" do
      @memory.transportation_id = nil
      @memory.valid?
      expect(@memory.errors.full_messages).to include("移動手段を入力してください")
    end

    it "交通機関情報が空だと登録できない" do
      @memory.trans_memo = nil 
      @memory.valid?
      expect(@memory.errors.full_messages).to include("交通機関情報を入力してください")
    end

    it "交通機関情報が401字以上だと登録できない" do
      @memory.trans_memo = Faker::Lorem.characters(number: 401)
      @memory.valid?
      expect(@memory.errors.full_messages).to include("交通機関情報は400字以内で記入してください")
    end

    it "ホテル名が空だと登録できない" do
      @memory.hotel = nil 
      @memory.valid?
      expect(@memory.errors.full_messages).to include("ホテル名を入力してください")
    end

    it "ホテル名が41字以上だと登録だきない" do
      @memory.hotel = Faker::Lorem.characters(number: 41)
      @memory.valid?
      expect(@memory.errors.full_messages).to include("ホテル名は40字以内で記入してください")
    end

    it "ホテル情報が空だと登録できない" do
      @memory.hotel_memo = nil 
      @memory.valid?
      expect(@memory.errors.full_messages).to include("ホテル情報を入力してください")
    end

    it "ホテル情報が401字以上だと登録できない" do
      @memory.hotel_memo = Faker::Lorem.characters(number: 401) 
      @memory.valid?
      expect(@memory.errors.full_messages).to include("ホテル情報は400字以内で記入してください")
    end

    it "面白かった事が空だと登録できない" do
      @memory.best = nil
      @memory.valid?
      expect(@memory.errors.full_messages).to include("面白かったことを入力してください")
    end

    it "面白かった事が401字以上だと登録できない" do
      @memory.best = Faker::Lorem.characters(number: 401)
      @memory.valid?
      expect(@memory.errors.full_messages).to include("面白かったことは400字以内で記入してください")
    end

    it "ハプニングが空だと登録できない" do
      @memory.happening = nil
      @memory.valid?
      expect(@memory.errors.full_messages).to include("ハプニングを入力してください")
    end

    it "ハプニングが401字以上だと登録できない" do
      @memory.happening = Faker::Lorem.characters(number: 401) 
      @memory.valid?
      expect(@memory.errors.full_messages).to include("ハプニングは400字以内で記入してください")
    end

    it "またやりたい事が空だと登録できない" do
      @memory.again = nil
      @memory.valid?
      expect(@memory.errors.full_messages).to include("また行きたい・やりたいことを入力してください")
    end

    it "またやりたい事が401字以上だと登録できない" do
      @memory.again = Faker::Lorem.characters(number: 401) 
      @memory.valid?
      expect(@memory.errors.full_messages).to include("また行きたい・やりたいことは400字以内で記入してください")
    end
  end
end
