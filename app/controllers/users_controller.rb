class UsersController < ApplicationController
  def show
    @user = current_user
    @my_dogs = current_user.my_dogs.all
    # .page(params[:page]).per(2)
    @date = Date.current
    # @bigは大型犬
    @big = MyDog.sizes.key(0)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.email == 'guest@example.com'
      flash[:alert] = 'ゲストユーザーは編集できません。'
      redirect_to my_page_path
    else
      @user.update(user_params)
      flash[:notice] = 'ユーザー情報を編集しました。'
      redirect_to my_page_path(current_user.id)
    end
  end

  def unsubscribe
    @user = current_user
  end

  def destroy
    @user = current_user
    if @user.email == 'guest@example.com'
      flash[:alert] = 'ゲストユーザーは削除できません。'
      redirect_to my_page_path
    else
      @user.destroy
      flash[:notice] = '退会しました。またのご利用をお待ちしています！'
      redirect_to root_path
    end
  end


  private
    def user_params
      params.require(:user).permit(:email, :last_name, :first_name, :user_name)
    end
end
