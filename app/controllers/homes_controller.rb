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
end
