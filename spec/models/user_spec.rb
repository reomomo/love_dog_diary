# frozen_string_literal: true

require "rails_helper"

RSpec.describe Diary, "モデルに関するテスト", type: :model do
  describe "モデルのテスト" do
    it "有効な会員情報の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
  describe "空白のバリデーションチェック" do
    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: '', first_name: '太郎', user_name: 'タロウ', email: 'taro@gmail')
      expect(user).to be_invalid
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: '田中', first_name: '', user_name: 'タロウ', email: 'taro@gmail')
      expect(user).to be_invalid
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: '田中', first_name: '太郎', user_name: '', email: 'taro@gmail')
      expect(user).to be_invalid
      expect(user.errors[:user_name]).to include("を入力してください")
    end
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: '田中', first_name: '太郎', user_name: 'タロウ', email: '')
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("を入力してください")
    end
  end
end