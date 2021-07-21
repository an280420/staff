class PositionHistoriesController < ApplicationController
  before_action :get_position

  # GET /position_histories/new
  def new
    @position_history = @position.position_history.build
  end

  # POST /position_histories
  def create
    @position_history = @position.position_history.build(position_history_params)

    if @position_history.save
      redirect_to @position_history, notice: 'Position history was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @position_history.update(position_history_params)
      redirect_to @position, notice: 'Position was successfully updated.'
    else
      render :edit
    end
  end

  private

  def get_position
    @position = Position.find(params[:position_id])
  end

  def set_position_history
    @position_history = @position.position_history.find(params[:id])
  end

  def position_history_params
    params.require(:position_history).permit(:name, :position_id, :begin_date, :end_date)
  end
end
