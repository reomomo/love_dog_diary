class DogDiariesController < ApplicationController
  before_action :authenticate_user!
end
