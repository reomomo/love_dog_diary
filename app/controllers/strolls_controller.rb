class StrollsController < ApplicationController
  def new
  end

  def index
  end

  def edit
  end

  private

  def stroll_params
    params.require(:stroll).permit(:diary_id, :my_dog_id, :road, :start_time, :end_time, :distance, :speed, :vitality_condition, :memo)

  end
end
