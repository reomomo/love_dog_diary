class DiariesController < ApplicationController
  before_action :authenticate_user!

  def new
    @date = params[:date]
    @diary = Diary.new
    @diary.dog_diaries.build
    @appetites = DogDiary.appetites
    @appetites_i18n = DogDiary.appetites_i18n
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
    @my_dogs = current_user.my_dogs.all
    @dog_diary = DogDiary.new
    @diary = Diary.find(params[:id])
    @diary_new = Diary.new
    @photo = Photo.new
  end

  def edit
  end

  private

  def diary_params
    params.require(:diary).permit(:diary_date, :memo)
  end
end
