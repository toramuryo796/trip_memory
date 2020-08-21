require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    it "全て正しい情報を入力したら登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "nicknameが41文字以上だと登録できない" do
      @user.nickname = Faker::Lorem.characters(number: 41)
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is invalid. Input within 40 characters")
    end
    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid. Include half_characters with '@'")
    end
    it "emailにひらがながあると登録できない" do
      @user.email = "あいうえお@gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid. Include half_characters with '@'")
    end
    it "emailにカタカナがあると登録できない" do
      @user.email = "アイウエオ@gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid. Include half_characters with '@'")
    end
    it "emailに漢字があると登録できない" do
      @user.email = "阿井雨絵尾@gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid. Include half_characters with '@'")
    end
    it "重複したemailでは登録できない" do
      another_user = FactoryBot.create(:user)
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid.Input half_width characters and number.", "Password confirmation doesn't match Password")
    end
    it "passwordにひらがながあると登録できない" do
      @user.password = "あいうえおかき"
      @user.password_confirmation = "あいうえおかき"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid.Input half_width characters and number.")
    end
    it "passwordにカタカナがあると登録できない" do
      @user.password = "アイウエオカキ"
      @user.password_confirmation = "アイウエオカキ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid.Input half_width characters and number.")
    end
    it "passwordに漢字があると登録できない" do
      @user.password = "啞伊鵜江男牡蠣"
      @user.password_confirmation = "啞伊鵜江男牡蠣"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid.Input half_width characters and number.")
    end
    it "passwordに半角英字だけでは登録できない" do
      @user.password = "aiueokaki"
      @user.password_confirmation = "aiueokaki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid.Input half_width characters and number.")
    end
    it "passwordに数字だけでは登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid.Input half_width characters and number.")
    end
    it "passwordに5文字以内では登録できない" do
      @user.password = "123ab"
      @user.password_confirmation = "1234ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
    end
    it "password_confirmationがないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
