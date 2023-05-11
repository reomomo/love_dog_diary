# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Mydog", type: :system do
  # let(:user) { create :user }
  # let(:my_dog) { create :my_dog }

  # 添付する画像を定義する
  image_path = Rails.root.join('spec/system/no-image.jpg')

  # 画像選択フォームに画像を添付する
  before do
    @user = create(:user)
    sign_in(@user)
    visit new_my_dog_path
    # @my_dog = FactoryBot.build(:user)
    # @my_dog = create(:my_dog, user_id: @user.id, name: "レオ", size: "small_size_dog")
    fill_in 'user_id', with: @user.id
    fill_in 'name', with: "レオ"
    fill_in 'size', with: "small_size_dog"
    attach_file('my_dog[image]', image_path, make_visible: true)
    click_button '登録する'
    byebug
    # visit my_page_path
  end
  it "添付したテスト用の画像が画面に存在するか" do
    expect(page).to have_selector("img[src$='no-image.jpg']")
  end
end