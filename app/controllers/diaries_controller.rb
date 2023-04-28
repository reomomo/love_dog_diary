class DiariesController < ApplicationController
  before_action :check_dog, only:[:new, :index, :show, :edit]

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
    @my_dogs = current_user.my_dogs.page(params[:page]).per(2)
  end

  def show
    @diary = Diary.find(params[:id])
  unless @diary.user_id == current_user.id
    redirect_to diaries_path
  end
    @photo = Photo.new
    @photos = @diary.photos.page(params[:page]).per(8)
    @strolls = @diary.strolls.all
    @total_distances = 0
    @total_min = 0

    @diary.strolls.all.each do |stroll|
      total = 0
      stroll.pins.all.each do |pin|
        # 1回の散歩ごとの散歩距離（複数のポリラインの合計距離）
        total += pin.distance
      end
      # 一日合計の散歩距離
      @total_distances += total
      # 一日合計の散歩
      @total_min += stroll.time_of_stroll
    end
  end

  def edit
    @diary = Diary.find(params[:id])
  unless @diary.user_id == current_user.id
    redirect_to diaries_path
  end
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

  def check_dog
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    end
  end

  def diary_params
    params.require(:diary).permit(:user_id, :my_dog_id, :diary_date, :memo, :appetite, :excreta)
  end
end
