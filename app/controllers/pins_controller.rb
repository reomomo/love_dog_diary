class PinsController < ApplicationController

  def new
    @pin = Pin.new
    @stroll_id = params[:stroll_id]
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.stroll.diary.user_id = current_user.id
    @pin.save
    redirect_to diary_path(@pin.stroll.diary.id)
  end

  def destroy 
    
  end
  
  
  private

  def pin_params
    params.require(:pin).permit(:stroll_id, :latitude, :longitude)
  end
end
