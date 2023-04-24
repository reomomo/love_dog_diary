class HomesController < ApplicationController
  def top
  end

  def about
    @path_id = params[:path_id].to_i
  end
end
