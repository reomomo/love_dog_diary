class StrollsController < ApplicationController
  before_action :check_dog, only:[:new, :index, :show, :edit]

  def new
    @stroll = Stroll.new
    @vitality_conditions = Stroll.vitality_conditions
    @diary_id = params[:diary_id]
    @dog_id = params[:dog_id]
  end

  def create
    @stroll = Stroll.new(stroll_params)
    @stroll.user_id = current_user.id
    @stroll.save
    flash[:notice] = '散歩情報を登録しました。'
    redirect_to diary_path(@stroll.diary.id)
  end

  def index
      @strolls = current_user.strolls.page(params[:page]).per(10)
  end

  def show
    @stroll = Stroll.find(params[:id])
  unless @stroll.user_id == current_user.id
    redirect_to strolls_path
  end
    @pins = @stroll.pins.all
    @pin = @stroll.pins.order(updated_at: :desc).first
  end

  def edit
    @stroll = Stroll.find(params[:id])
  unless @stroll.user_id == current_user.id
    redirect_to strolls_path
  end
    @vitality_conditions = Stroll.vitality_conditions
  end

  def update
    @stroll = Stroll.find(params[:id])
    @stroll.user_id = current_user.id
    @stroll.update(stroll_params)
    flash[:notice] = '散歩情報を編集しました。'
    redirect_to diary_path(@stroll.diary.id)
  end

  private
  def stroll_params
    params.require(:stroll).permit(:user_id, :diary_id, :my_dog_id, :start_time, :end_time, :vitality_condition, :memo)
  end

  def check_dog
    if current_user.my_dogs.empty?
      flash[:info] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    end
  end
end
