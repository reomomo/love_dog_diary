class DiariesController < ApplicationController
  before_action :authenticate_user!

  def new
    @date = params[:date]
    @diary = Diary.new
    @my_dogs = current_user.my_dogs.all
    @appetites = Diary.appetites
    @excreta = Diary.excreta
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    @diary.save
    redirect_to diary_path(@diary.id)

  end

  def index

  end

  def show
    @diary = Diary.find(params[:id])
    current_user.my_dogs


    @diary_new = Diary.new
    @photo = Photo.new
  end

  def edit
  end

  private

  def diary_params
    params.require(:diary).permit(:my_dog_id, :diary_date, :memo, :appetite, :excreta)
  end
end
