require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "スケジュール" do
    before do
      @schedule = FactoryBot.build(:schedule)
    end
    it "全て正しい情報を入力していれば登録できる" do
      expect(@schedule).to be_valid
    end

    it " 予定が101字以上だと登録できない " do
      @schedule.program = Faker::Lorem.characters(number: 101)
      @schedule.invalid?
      expect(@schedule.errors.full_messages).to include("予定は100字以内で記入してください")
    end
  end
end
