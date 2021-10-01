class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:items).permit
  end
end
