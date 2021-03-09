class GoalsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @goals = Goal.includes(:user)
  end
  
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @goals = Goal.includes(:user)
    @goal = Goal.find_by(params[:id])
  end


  def destroy
    @goal = Goal.find_by(params[:id])
    @goal.destroy
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def goal_params
    params.require(:goal).permit(:text).merge(user_id: current_user.id )
  end
end
