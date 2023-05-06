class PinsController < ApplicationController
  before_action :check_dog, only:[:new]

  def new
    @pin = Pin.new
      # @form = Form::PinCollection.new
    @stroll_id = params[:stroll_id]
  end

  def create
    latlngs = params[:pin][:txtLatLng].split("\r\n")
    distance = params[:pin][:distances].split(":")
    pin = Pin.new
    latlngs.each_with_index do |latlng, index|
      pin = Pin.new
      pin.user_id = current_user.id
      pin.stroll_id = params[:pin][:stroll_id]
      pin.latitude = latlng.split(",")[0]
      pin.longitude = latlng.split(",")[1]
      if index == 0
        pin.distance = 0
      else
        pin.distance = distance[index-1]
      end
      pin.title = params[:pin][:title]
      pin.save
    end
    redirect_to diary_path(pin.stroll.diary.id)
  end

  def destroy
    stroll = Stroll.find(params[:stroll_id])
    stroll.user_id = current_user.id
    pins = stroll.pins.all
    pins.destroy_all
    redirect_to strolls_path
  end


  private

  def check_dog
    if current_user.my_dogs.empty?
      flash[:info] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    end
  end

  def pin_params
    params.require(:pin).permit(:user_id, :stroll_id, :latitude, :longitude, :distance, :title)
  end
end
