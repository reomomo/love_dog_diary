class UsersController < ApplicationController
  def show
    @user = current_user
    @my_dogs = current_user.my_dogs.page(params[:page]).per(2)
    @date = Date.current
    # @bigは大型犬
    @big = MyDog.sizes.key(0)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to my_page_path(current_user.id)
  end

  def unsubscribe
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :user_name)
  end
end
