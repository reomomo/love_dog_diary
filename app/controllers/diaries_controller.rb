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
    @diary = current_user.diaries.find(params[:id])
    current_user.my_dogs
    @photo = Photo.new
  end

  def edit
  end

  def update
    diary = current_user.diaries.find(params[:id])
    diary.user_id = current_user.id
    diary.update(diary_params)
    redirect_to diary_path(diary.id)

  end

  private

  def diary_params
    params.require(:diary).permit(:my_dog_id, :diary_date, :memo, :appetite, :excreta)
  end
end
