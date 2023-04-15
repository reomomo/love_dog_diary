class UsersController < ApplicationController
  def show

  end

  def edit

  end

  def update

  end

  def unsubscribe

  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :user_name)
  end
end
