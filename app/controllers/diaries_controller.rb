class DiariesController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    else
      @date = params[:date]
      @dog_id = params[:dog_id]
      @diary = Diary.new
      @my_dogs = current_user.my_dogs.all
      @appetites = Diary.appetites
      @excreta = Diary.excreta
    end
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    @diary.save
    redirect_to diary_path(@diary.id)
  end

  def index
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    else
      @my_dogs = current_user.my_dogs.page(params[:page]).per(2)
    end
  end

  def show
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    else
      @diary = current_user.diaries.find(params[:id])
      @photo = Photo.new
      @photos = @diary.photos.page(params[:page]).per(4)
      @strolls = @diary.strolls.all
    end

  end

  def edit
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    else
      @diary = current_user.diaries.find(params[:id])
      @appetites = Diary.appetites
      @excreta = Diary.excreta
    end
  end

  def update
    diary = current_user.diaries.find(params[:id])
    diary.user_id = current_user.id
    diary.update(diary_params)
    redirect_to diary_path(diary.id)
  end

  def destroy
    pins = current_user.strolls.pins.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :my_dog_id, :diary_date, :memo, :appetite, :excreta)
  end
end
