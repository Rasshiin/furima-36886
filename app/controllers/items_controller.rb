class ItemsController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
  end

  private
  def user_params
    params.require(:user).permit()
  end
end
