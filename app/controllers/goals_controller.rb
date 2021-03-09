class GoalsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @goals = Goal.all.order('created_at DESC')
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

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    redirect_to root_path
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
