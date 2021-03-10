class ListsController < ApplicationController
  def index
    @lists = List.oder('limit').all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :index
    else
      render :new
    end
  end

  private
  def list_params
    params.require(:list).permit(:task,:limit).merge(user_id: current_user.id )
  end
end