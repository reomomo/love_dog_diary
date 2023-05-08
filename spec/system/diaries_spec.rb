# frozen_string_literal: true

require "rails_helper"

describe "日記保存のテスト" do
  let!(:diary) { create(:diary, user_id: 3, my_dog_id: 9, diary_date: "2023年5月7日", memo: "涼しくてよく歩いた", appetite: "usually",excreta: "usually") }
  describe "トップ画面(root_path)のテスト" do
    before do
      visit root_path
    end
    context "表示の確認" do
      it "トップ画面(root_path)にaboutページへのリンクが表示されているか" do
        expect(page).to have_link "", href: about_path, with: path_id
      end
      it 'root_pathが""であるか' do
        expect(current_path).to eq("/")
      end
    end
  end

  describe "一覧画面のテスト" do
    before do
      visit diaries_path
    end
    context "リンクの確認" do
      it "日記の新規登録のリンクが表示されるか" do
         expect(page).to have_link "", href: new_diary_path
        # new_link = find_all('a')[10]
        # expect(new_link.native.inner_text).to match(8)
        # expect(page).to have_current_path new_diary_path
      end
      it "日記の詳細画面へのリンクが表示されるか" do
        show_link = find_all("a")[9]
        expect(show_link.native.inner_text).to match(7)
        ecpect(page).to have_current_path diary_path(diary)
      end
    end

  end

  describe "日記保存画面のテスト" do
    before do
      visit new_diary_path
    end
    context "表示の確認" do
      it 'new_diary_pathが"/diaries/new"を含むURLか' do
        "current_path".should include "/diaries/new"
      end
      it "保存ボタンが表示される" do
        expect(page).to have_button "保存する"
      end
    end
    context "日記保存処理のテスト" do
      # fill_in 'diary[user_id]', '1'
      # fill_in 'diary[my_dog_id]', '1'
      # fill_in 'diary[diary_date]', with: '2023年5月7日'
      # fill_in 'diary[memo]', Faker::Lorem.characters(number:20)
      # fill_in 'diary[appetite]', 'usually'
      # fill_in 'diary[excreta]', 'usually'
      # click_button '保存する'
      # expect(page).to have_current_path diary_path(Diary.last)
    end
  end

  describe "一覧画面のテスト" do
    before do
      visit diaries_path
    end
    context "一覧の表示の確認" do
      it "保存した日記がカレンダーに表示されているか" do
        expect(page).to have_field "diary[diary_date]"
        expect(page).to have_field "diary[appetite]"
        expect(page).to have_field "diary[excreta]"
      end
    end
  end

  describe "編集画面のテスト" do
    before do
      visit edit _diary_path(diary)
    end
    context "表示の確認" do
      it "編集前のメモ、食欲、排せつが表示されている" do
        expect(page).to have_field "diary[memo]", with: diary.memo
        expect(page).to have_field "diary[appetite]", with: diary.appetite
        expect(page).to have_field "diary[excreta]", with: diary.excreta
      end
      it "変更するボタンが表示される" do
        expect(page).to have_button "変更する"
      end
    end
    context "更新処理に関するテスト" do
      it "更新後のリダイレクト先は正しいか" do
        fill_in "diary[memo]",with: Faker::Lorem.characters(number:20)
        fill_in "diary[appetite]", "usually"
        fill_in "diary[excreta]", "usually"
        click_button "変更する"
        expect(page).to have_current_path diary_path(diary)
      end
    end
  end
end




