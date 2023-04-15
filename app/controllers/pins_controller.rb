class PinsController < ApplicationController

  private

  def pin_params
    params.require(:pin).permit(:latitude, :longitude)
  end
end
