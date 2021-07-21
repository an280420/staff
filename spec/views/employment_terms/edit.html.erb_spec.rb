require 'rails_helper'

RSpec.describe "employment_terms/edit", type: :view do
  before(:each) do
    @employment_term = assign(:employment_term, EmploymentTerm.create!())
  end

  it "renders the edit employment_term form" do
    render

    assert_select "form[action=?][method=?]", employment_term_path(@employment_term), "post" do
    end
  end
end
