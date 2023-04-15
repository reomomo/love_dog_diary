class DogDiariesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @tag = @post.tags.new
  end

  private

  def dog_diary_params
    params.require(:dog_diary).permit(:appetite, :excreta, :age, :human_age)
  end

end


