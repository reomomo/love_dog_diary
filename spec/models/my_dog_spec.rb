# frozen_string_literal: true

require "rails_helper"

RSpec.describe Diary, "モデルに関するテスト", type: :model do
  describe "モデルのテスト" do
    before do
      @user = create(:user)
    end
    it "有効な日記内容の場合は保存されるか" do
      expect(FactoryBot.build(:my_dog)).to be_valid
    end
  end
  describe "空白のバリデーションチェック" do
    before do
      @user = create(:user)
    end
    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      my_dog = MyDog.new(name: '', size: 'small_size_dog')
      expect(my_dog).to be_invalid
      expect(my_dog.errors[:name]).to include("を入力してください")
    end
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      my_dog = MyDog.new(name: 'レオ', size: '')
      expect(my_dog).to be_invalid
      expect(my_dog.errors[:size]).to include("を入力してください")
    end
  end
end