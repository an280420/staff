class EmploymentTermsController < ApplicationController
  before_action :get_user
  before_action :set_employment_term, only: [:show, :edit, :update]

  # GET /employment_terms
  def index
    @employment_terms = @user.employment_terms
  end

  # GET /employment_terms/1
  def show
  end

  # GET /employment_terms/new
  def new
    @employment_term = @user.employment_terms.build
  end

  # GET /employment_terms/1/edit
  def edit
  end

  # POST /employment_terms
  def create
    @employment_term = @user.employment_terms.build(employment_term_params)

    if @employment_term.save
      redirect_to user_employment_terms_path(@user), notice: 'Employment term was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /employment_terms/1
  def update
    if @employment_term.update(employment_term_params)
      redirect_to user_employment_terms_path(@user), notice: 'Employment term was successfully updated.'
    else
      render :edit
    end
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_employment_term
    @employment_term = @user.employment_terms.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employment_term_params
    params.require(:employment_term).permit(:user_id, :division_id, :position_id, :begin_date, :end_date)
  end
end
