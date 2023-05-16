# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stroll, "モデルに関するテスト", type: :model do
  describe "モデルのテスト" do
    before do
      @user = create(:user)
      @my_dog = create(:my_dog)
      @diary = create(:diary)
    end
    it "有効な散歩情報の場合は保存されるか" do
      expect(FactoryBot.build(:stroll)).to be_valid
    end
  end
  describe '#time_of_stroll' do
    before do
      @user = create(:user)
      @my_dog = create(:my_dog)
      @diary = create(:diary)
    end
    let(:stroll) {
      create(:stroll, start_time: '7:00', end_time: '8:00')
    }
    it 'スタートから終了までの時間が返されること' do
      expect(stroll.time_of_stroll).to eq 60
    end
  end
end