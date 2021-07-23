class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    if params[:begin_date] && params[:end_date]
      date_range = params[:begin_date]..params[:end_date]
      @employment_terms = @user.employment_terms.where(begin_date: date_range)
      
      # @employment_terms = @user.employment_terms.where("begin_date = ? AND end_date = ?", date_range, date_range)
      
      # binding.pry
      
      @title = 'Занимаемые должности на запрашиваемый период'
    else
      @employment_terms = [@user.employment_terms.find_by(end_date: nil)]
      @title = 'Текущие условия труда'
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

   # def find_by_dates
  #   if params[:begin_date] && params[:end_date]
  #    begin_date = params[:begin_date]
  #    end_date = params[:end_date]
  #    @sort_employment_term = @user.employment_terms.where(employment_terms: {:begin_date >= begin_date && :end_date <= end_date})
  #   redirect_to :action => 'find_results'  
  #   end
  # end

  # Entry.find(:all).where(:date => start_date..end_date).where(:time => start_time..end_time) 
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:l_name, :f_name, :s_name, :begin_date, :end_date)
  end
end
