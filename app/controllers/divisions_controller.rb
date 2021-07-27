class DivisionsController < ApplicationController
  def index
    # @divisions = Division.includes(employment_terms: [:user, position: [:position_history]]).where(employment_terms: {end_date: nil})
    divisions = Division.includes(employment_terms: [:user, position: [:position_history]])
    
    root = divisions.root

    @divisions_for_render = root.tree_as_json
  end

  def show
  end
end
