require 'rails_helper'

RSpec.describe "employment_terms/show", type: :view do
  before(:each) do
    @employment_term = assign(:employment_term, EmploymentTerm.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
