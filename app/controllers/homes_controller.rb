class HomesController < ApplicationController
  def top
  end

  def about
    @path_id = params[:path_id].to_i
    @foods = ["普通", "多い", "少ない"]
    @dookies = ["少ない", "普通", "多い"]
    @times = [75, 50, 60, 70, 55, 0]
    @distances = [2050, 1490, 1960, 2160, 1870, 1640]
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "ゲスト"
      user.first_name = "太郎"
      user.user_name = "ゲスト"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
