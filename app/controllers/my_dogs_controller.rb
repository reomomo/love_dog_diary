class MyDogsController < ApplicationController

  def new
    @my_dog = MyDog.new
  end

  def create
    @my_dog = MyDog.new(my_dog_params)
    @my_dog.user_id = current_user.id
    if @my_dog.save
      redirect_to my_page_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @my_dog = MyDog.find(params[:id])
  end

  def update
    my_dog = MyDog.find(params[:id])
    my_dog.user_id = current_user.id
    my_dog.update(my_dog_params)
    redirect_to my_page_path(current_user.id)
  end

  private

  def my_dog_params
    params.require(:my_dog).permit(:user_id, :name, :size, :birthdate, :age, :human_age)
  end
end
