class PinsController < ApplicationController

  private

  def pin_params
    params.require(:pin).permit(:stroll_id, :latitude, :longitude)
  end
end
