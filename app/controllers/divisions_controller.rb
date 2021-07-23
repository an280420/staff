class DivisionsController < ApplicationController
  def index
    @divisions = Division.all
    # @divisions = Division.includes(employment_terms: [:user, position: [:position_history]]).where(employment_terms: {end_date: nil})
  end

  def show
  end
end
