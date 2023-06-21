class DiariesController < ApplicationController
  before_action :check_dog, only:[:new, :index, :show, :edit]
  before_action :ensure_user, only:[:show, :edit, :update]

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
    flash[:notice_diary] = '日記を登録しました。'
    redirect_to diary_path(@diary.id)
  end

  def index
    @user = current_user
    @my_dogs = @user.my_dogs.page(params[:page]).per(5)
  end

  def show
    @photo = Photo.new
    @photos = @diary.photos.page(params[:page]).per(8)
    @strolls = @diary.strolls.all
    @total_distances = 0
    @total_min = 0
    @diary.strolls.all.each do |stroll|
      total = stroll.pins.sum(:distance)
      # 一日合計の散歩距離
      @total_distances += total
      # 一日合計の散歩時間
      @total_min += stroll.time_of_stroll
    end
  end

  def edit
    @appetites = Diary.appetites
    @excreta = Diary.excreta
  end

  def update
    diary = current_user.diaries.find(params[:id])
    diary.user_id = current_user.id
    diary.update(diary_params)
    flash[:notice_diary] = '日記を編集しました。'
    redirect_to diary_path(diary.id)
  end

  private

  def check_dog
    if current_user.my_dogs.empty?
      flash[:info] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    end
  end

  def ensure_user
    @diary = Diary.find(params[:id])
    unless @diary.user_id == current_user.id
      redirect_to diaries_path
    end
  end

  def diary_params
    params.require(:diary).permit(:user_id, :my_dog_id, :diary_date, :memo, :appetite, :excreta)
  end
end
