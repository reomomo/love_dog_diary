class DiariesController < ApplicationController
  before_action :authenticate_user!

  def new
    @date = params[:date]
    @diary = Diary.new
    @my_dogs = current_user.my_dogs.all
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
    @my_dog = MyDog.find(params[:diary][:my_dog_id])
    if DogDiary.where(diary_id: @diary).nil?
      @dog_diary = DogDiary.new
    # else
    #   @dog_diary = DogDiary.find_by(diary_id: @diary)
    end
    @appetites = DogDiary.appetites
    @excreta = DogDiary.excreta
    @my_dogs = current_user.my_dogs.all
    @dog_diary = DogDiary.new

    @diary_new = Diary.new
    @photo = Photo.new
  end

  def edit
  end

  private

  def diary_params
    params.require(:diary).permit(:diary_date, :memo, :appetite, :excreta)
  end
end
