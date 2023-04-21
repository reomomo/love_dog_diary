class StrollsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    elsif params[:diary_id] == nil
      flash[:notice] = "先に日記を登録してください"
      redirect_to diaries_path
    else
      @stroll = Stroll.new
      @vitality_conditions = Stroll.vitality_conditions
      @diary_id = params[:diary_id]
      @dog_id = params[:dog_id]
    end
  end

  def create
    @stroll = Stroll.new(stroll_params)
    @stroll.diary.user.id = current_user.id
    @stroll.save
    redirect_to diary_path(@stroll.diary.id)
  end

  def index
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    else
      @strolls = current_user.strolls.page(params[:page]).per(20)
    end
  end

  def show
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    else
      @stroll = Stroll.find(params[:id])
      @pins = @stroll.pins.all
      @pin = @stroll.pins.order(updated_at: :desc).first
    end
  end

  def edit
    if current_user.my_dogs.empty?
      flash[:notice] = "先に愛犬情報を登録してください"
      redirect_to new_my_dog_path
    else
      @stroll = Stroll.find(params[:id])
      @pins = @stroll.pins.all
      @pin = @stroll.pins.order(updated_at: :desc).first
    end
  end

  def updated
    @stroll = Stroll.find(params[:id])
    @stroll.my_dog.user.id = current_user.id
    @stroll.update(stroll_params)
    redirect_to diary_path(@stroll.diary.id)
  end

  private

  def stroll_params
    params.require(:stroll).permit(:user_id, :diary_id, :my_dog_id, :start_time, :end_time, :vitality_condition, :memo)

  end
end
