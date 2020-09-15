require 'rails_helper'

RSpec.describe Dictionary, type: :model do
  describe "単語帳" do
    before do
      @dictionary = FactoryBot.build(:dictionary)
    end
    it "全て正しく記入されていれば登録できる" do
      expect(@dictionary).to be_valid
    end

    it "言語が空だと登録できない" do
      @dictionary.language = nil
      @dictionary.valid?
      expect(@dictionary.errors.full_messages).to include("言語を入力してください", "言語は全角文字で入力")
    end

    it "言語が半角英字だと登録できない" do
      @dictionary.language = "abcdefg"
      @dictionary.valid?
      expect(@dictionary.errors.full_messages).to include("言語は全角文字で入力")
    end
    
    it "言語が半角数字だと登録できない" do
      @dictionary.language = "123456"
      @dictionary.valid?
      expect(@dictionary.errors.full_messages).to include("言語は全角文字で入力")
    end
    
    it "言語が41字以上だと登録できない" do
      @dictionary.language = Faker::Lorem.characters(number: 41)
      @dictionary.valid?
      expect(@dictionary.errors.full_messages).to include("言語は全角文字で入力", "言語は40字以内で記入してください")
    end
    
    it "日本語が空だと登録できない" do
      @dictionary.japanese = nil
      @dictionary.valid?
      expect(@dictionary.errors.full_messages).to include("日本語を入力してください")
    end
    
    it "日本語が41字以上だと登録できない" do
      @dictionary.japanese = Faker::Lorem.characters(number: 41)
      @dictionary.valid?
      expect(@dictionary.errors.full_messages).to include("日本語は40字以内で記入してください")
    end
    
    it "外国語が空だと登録できない" do
      @dictionary.translation = nil
      @dictionary.valid?
      expect(@dictionary.errors.full_messages).to include("外国語を入力してください")
    end
    
    it "外国語が41字以上だと登録できない" do
      @dictionary.translation = Faker::Lorem.characters(number: 41)
      @dictionary.valid?
      expect(@dictionary.errors.full_messages).to include("外国語は40字以内で記入してください")
    end
    
  end
end
