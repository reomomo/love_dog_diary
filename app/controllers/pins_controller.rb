class PinsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    elsif @diary_id = params[:stroll_id].empty?
      flash[:notice] = "先に散歩情報を登録してください"
      redirect_to diaries_path
    else
      @pin = Pin.new
      # @form = Form::PinCollection.new
      @stroll_id = params[:stroll_id]
    end
  end

  def create
    lat_lngs = params[:pin][:txtLatLng].split("\n")
    distance = params[:pin][:distances].split(":")

    lat_lngs.each_with_index do |latLng, index|
      pin = Pin.new
      pin.stroll_id = params[:pin][:stroll_id]
      pin.latitude = latLng.split(",")[0]
      pin.longitude = latLng.split(",")[1]
      if index == 0
        pin.distance = 0
      else
        pin.distance = distance[index-1]
      end
      pin.title = params[:pin][:title]
      pin.save
    end
    redirect_to diaries_path
  end

  def destroy
    stroll = current_user.strolls.find(params[:stroll_id])
    pins = stroll.pins.all
    pins.destroy_all
    redirect_to strolls_path
  end


  private

  def pin_params
    params.require(:pin).permit(:stroll_id, :latitude, :longitude, :distance, :title)
  end
end
