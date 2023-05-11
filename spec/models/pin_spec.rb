# frozen_string_literal: true

require "rails_helper"

RSpec.describe Pin, "モデルに関するテスト", type: :model do
  describe "モデルのテスト" do
    before do
      @user = create(:user)
      @my_dog = create(:my_dog)
      @diary = create(:diary)
      @stroll = create(:stroll)
    end
    it "有効な地図情報の場合は保存されるか" do
      expect(FactoryBot.build(:pin)).to be_valid
    end
  end
end