class PinsController < ApplicationController
  before_action :authenticate_user!

  def new
    @pin = Pin.new
    # @form = Form::PinCollection.new
    @stroll_id = params[:stroll_id]
  end

  def create
    lat_langs = params[:pin][:txtLatLng].split(":")

    lat_langs.each do |latLng|
      pin = Pin.new
      pin.stroll_id = params[:pin][:stroll_id]
      pin.latitude = latLng.split(",")[0]
      pin.longitude = latLng.split(",")[1]
      pin.save
    end

    redirect_to diaries_path
  end

  def destroy

  end


  private

  def pin_params
    params.require(:pin).permit(:latitude, :longitude, :stroll_id)
  end
end
