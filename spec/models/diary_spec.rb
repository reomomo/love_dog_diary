# frozen_string_literal: true

require 'rails_helper'
describe 'モデルのテスト' do
  it '有効な日記内容の場合は保存されるか' do
    expect(FactoryBot.build(:diary)).to be_valid
  end
end
  