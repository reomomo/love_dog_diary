class StrollsController < ApplicationController
  def new
    @stroll = Stroll.new
    @vitality_conditions = Stroll.vitality_conditions
    @diary_id = 1
    @dog_id = 2
  end

  def create
    @stroll = Stroll.new(stroll_params)
    @stroll.my_dog.user.id = current_user.id
    @stroll.save
    redirect_to diary_path(1)
  end

  def index
    @lat_c = 40.774102
    @lng_c = -73.971734
    @lat = 40.7767644
    @lng = -73.9761399
    @lat_m = 40.77976635908304
    @lng_m = -73.96337236616391
  end

  def edit
    @stroll = Stroll.find(params[:id])
    @pins = @stroll.pins.all
    @pin = @stroll.pins.where(updated_at: :desc).limit(1)
  end

  def updated
    @stroll = Stroll.find(params[:id])
    @stroll.my_dog.user.id = current_user.id
    @stroll.update(stroll_params)
    redirect_to diary_path(@stroll.diary.id)
  end

  private

  def stroll_params
    params.require(:stroll).permit(:diary_id, :my_dog_id, :road, :start_time, :end_time, :distance, :speed, :vitality_condition, :memo)

  end
end
