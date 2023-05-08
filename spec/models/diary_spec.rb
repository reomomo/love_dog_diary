# frozen_string_literal: true

require "rails_helper"

RSpec.describe Diary, "モデルに関するテスト", type: :model do
  describe "実際に保存してみる" do
    before do
      @user = create(:user)
      @my_dog = create(:my_dog, user_id: @user.id)
    end
    it "有効な日記内容の場合は保存されるか" do
      expect(FactoryBot.build(:diary)).to be_valid
    end
  end
end
