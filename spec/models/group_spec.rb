require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'グループ作成' do
    before do
      @group = FactoryBot.build(:group)
      @user = FactoryBot.create(:user)
    end
    it "グループ名が記入されていれば登録できる" do
      expect(@group).to be_valid
    end

    it "グループ名が40字以内なら登録できる" do
      @group.name = Faker::Lorem.characters(number: 40)
      expect(@group).to be_valid
    end

    it "グループ名が空だと登録できない" do
      @group.name = nil
      @group.valid?
      expect(@group.errors.full_messages).to include("グループ名を入力してください")
    end

    it "重複したグループ名は登録できない" do
      another_group = FactoryBot.create(:group)
      @group.valid?
      expect(@group.errors.full_messages).to include("グループ名はすでに存在します")  
    end

    it "グループ名が40字以上だと登録できない" do
      @group.name = Faker::Lorem.characters(number:41)
      @group.valid?
      expect(@group.errors.full_messages).to include("グループ名は40字以内で記入してください")
    end
  end
end



