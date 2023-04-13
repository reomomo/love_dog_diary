class DiariesController < ApplicationController
  def new
  end

  def index

  end

  def show
    @diary_date = params[:diary_date]
    # @diary = Diary.find(params[:id])
    @photo = Photo.new
  end

  def edit
  end

end
