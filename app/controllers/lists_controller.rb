class ListsController < ApplicationController
  def index
    @lists = List.order('created_at DESC')
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to :index
  end

  private
  def list_params
    params.require(:list).permit(:task,:limit).merge(user_id: current_user.id )
  end
end