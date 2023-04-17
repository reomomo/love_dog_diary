class DiariesController < ApplicationController
  before_action :authenticate_user!

  def new
    @date = params[:date]
    @dog_id = params[:dog_id]
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
    @my_dogs = current_user.my_dogs
  end

  def show
    @diary = current_user.diaries.find(params[:id])
    @photo = Photo.new
    @photos = @diary.photos.all
    @strolls = @diary.strolls.all
  end

  def edit
    @diary = current_user.diaries.find(params[:id])
    @appetites = Diary.appetites
    @excreta = Diary.excreta
  end

  def update
    diary = current_user.diaries.find(params[:id])
    diary.user_id = current_user.id
    diary.update(diary_params)
    redirect_to diary_path(diary.id)

  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :my_dog_id, :diary_date, :memo, :appetite, :excreta)
  end
end
