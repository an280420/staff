require 'rails_helper'

RSpec.describe "employment_terms/index", type: :view do
  before(:each) do
    assign(:employment_terms, [
      EmploymentTerm.create!(),
      EmploymentTerm.create!()
    ])
  end

  it "renders a list of employment_terms" do
    render
  end
end
