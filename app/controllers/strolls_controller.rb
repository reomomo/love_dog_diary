class StrollsController < ApplicationController
  before_action :check_dog, only:[:new, :index, :show, :edit]
  before_action :ensure_user, only:[:show, :edit, :update]

  def new
    @stroll = Stroll.new
    @vitality_conditions = Stroll.vitality_conditions
    @diary_id = params[:diary_id]
    @dog_id = params[:dog_id]
  end

  def create
    @stroll = Stroll.new(stroll_params)
    @stroll.user_id = current_user.id
    if @stroll.save
      flash[:notice_stroll] = '散歩情報を登録しました。'
      redirect_to diary_path(@stroll.diary.id)
    else
      flash[:notice_stroll] = '時間と「元気の良さ」を設定してください。'
      redirect_to diary_path(@stroll.diary.id)
    end
  end

  def index
      @strolls = current_user.strolls.page(params[:page]).per(10)
  end

  def show
    @pins = @stroll.pins.all
    @pin = @stroll.pins.order(updated_at: :desc).first
  end

  def edit
    @vitality_conditions = Stroll.vitality_conditions
  end

  def update
    @stroll = Stroll.find(params[:id])
    @stroll.user_id = current_user.id
    @stroll.update(stroll_params)
    flash[:notice_stroll] = '散歩情報を編集しました。'
    redirect_to diary_path(@stroll.diary.id)
  end

  private

  def stroll_params
    params.require(:stroll).permit(:user_id, :diary_id, :my_dog_id, :start_time, :end_time, :vitality_condition, :memo)
  end

  def ensure_user
    @stroll = Stroll.find(params[:id])
    unless @stroll.user_id == current_user.id
      redirect_to strolls_path
    end
  end

  def check_dog
    if current_user.my_dogs.empty?
      flash[:info] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    end
  end
end
