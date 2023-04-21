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
    lat_langs = params[:pin][:txtLatLng].split("\n")
    # distance = params[:pin][:distances].split(":")

    lat_langs.each do |latLng|
      pin = Pin.new
      pin.stroll_id = params[:pin][:stroll_id]
      pin.latitude = latLng.split(",")[0]
      pin.longitude = latLng.split(",")[1]
      pin.distance = 15
      # distance
      pin.title = params[:pin][:title]
      pin.save
    end
    redirect_to diaries_path
  end

  def destroy

  end


  private

  def pin_params
    params.require(:pin).permit(:stroll_id, :latitude, :longitude, :distance, :title)
  end
end
