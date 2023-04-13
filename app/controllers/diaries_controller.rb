class DiariesController < ApplicationController
  def new
  end

  def index
    @diaries = current_user.diaries.all
  end

  def show
    @photo = Photo.new
  end

  def edit
  end

end
