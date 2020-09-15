require 'rails_helper'

RSpec.describe Bring, type: :model do
  describe "持ち物リスト" do
    before do
      @bring = FactoryBot.build(:bring)
    end

    it "全て正しく記入されていれば登録できる" do
      expect(@bring).to be_valid
    end

    it "持ち物が空だと登録できない" do
      @bring.thing = nil 
      @bring.valid?
      expect(@bring.errors.full_messages).to include("持ち物を入力してください", "持ち物は全角文字で記入してください")
    end
    
    it "持ち物が半角英字だと登録できない" do
      @bring.thing = "abcdefg" 
      @bring.valid?
      expect(@bring.errors.full_messages).to include("持ち物は全角文字で記入してください")
    end

    it "持ち物が401字以上だと登録できない" do
      @bring.thing = Faker::Lorem.characters(number:401)
      @bring.valid?
      expect(@bring.errors.full_messages).to include("持ち物は全角文字で記入してください", "持ち物は40字以内で記入してください")
    end
  end
end
