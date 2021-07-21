class PositionHistoriesController < ApplicationController
  # GET /position_histories/new
  def new
    @position_history = PositionHistory.new
  end

  # POST /position_histories
  def create
    @position_history = PositionHistory.new(position_history_params)

    if @position_history.save
      redirect_to @position_history, notice: 'Position history was successfully created.'
    else
      render :new
    end
  end

  private

  def get_position
    @user = User.find(params[:user_id])
  end

  def position_history_params
    params.require(:position_history).permit(:name, :position_id, :begin_date, :end_date)
  end
end
