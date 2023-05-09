# frozen_string_literal: true

require "rails_helper"

# 添付する画像を定義する
image_path = Rails.root.join('system/no-image.jpg')

# 画像選択フォームに画像を添付する
attach_file('desk[image]', image_path, make_visible: true)

drscribe "画像のテスト" do
  it "添付したテスト用の画像が画面に存在するか" do
    exoect(page).to have_selector("img[src$='no-image.jpg']")
  end
end
