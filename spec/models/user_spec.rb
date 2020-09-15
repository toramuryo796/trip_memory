require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    it "全て正しい情報を入力したら登録できる" do
      expect(@user).to be_valid
    end
    it "user_IDが空だと登録できない" do
      @user.user_ID = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザーIDを入力してください", "ユーザーIDは半角英数字で入力してください")
    end
    it "user_IDが41文字以上だと登録できない" do
      @user.user_ID = Faker::Lorem.characters(number: 41)
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザーIDは40文字以内で入力してください")
    end
    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください", "Eメールは@を入れて半角で入力してください")
    end
    it "emailにひらがながあると登録できない" do
      @user.email = "あいうえお@gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは@を入れて半角で入力してください")
    end
    it "emailにカタカナがあると登録できない" do
      @user.email = "アイウエオ@gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは@を入れて半角で入力してください")
    end
    it "emailに漢字があると登録できない" do
      @user.email = "阿井雨絵尾@gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは@を入れて半角で入力してください")
    end
    it "重複したemailでは登録できない" do
      another_user = FactoryBot.create(:user)
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは半角英数字を混合させて入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordにひらがながあると登録できない" do
      @user.password = "あいうえおかき"
      @user.password_confirmation = "あいうえおかき"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字を混合させて入力してください")
    end
    it "passwordにカタカナがあると登録できない" do
      @user.password = "アイウエオカキ"
      @user.password_confirmation = "アイウエオカキ"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字を混合させて入力してください")
    end
    it "passwordに漢字があると登録できない" do
      @user.password = "啞伊鵜江男牡蠣"
      @user.password_confirmation = "啞伊鵜江男牡蠣"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字を混合させて入力してください")
    end
    it "passwordに半角英字だけでは登録できない" do
      @user.password = "aiueokaki"
      @user.password_confirmation = "aiueokaki"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字を混合させて入力してください")
    end
    it "passwordに数字だけでは登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字を混合させて入力してください")
    end
    it "passwordに5文字以内では登録できない" do
      @user.password = "123ab"
      @user.password_confirmation = "1234ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
    end
    it "password_confirmationがないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end
