class PinsController < ApplicationController
  before_action :authenticate_user!

  def new
    @pin = Pin.new
    # @form = Form::PinCollection.new
    @stroll_id = params[:stroll_id]
  end

  def create
    @form = Form::PinCollection.new(pin_collection_params)
    if  @form.save
    redirect_to diaries_path
    end
  end

  def destroy

  end


  private

  def pin_collection_params
    params.require(:form_pin_collection).permit(pins_attributes: Form::Pin::REGISTRABLE_ATTRIBUTES)
  end
end
