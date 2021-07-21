require 'rails_helper'

RSpec.describe "employment_terms/new", type: :view do
  before(:each) do
    assign(:employment_term, EmploymentTerm.new())
  end

  it "renders new employment_term form" do
    render

    assert_select "form[action=?][method=?]", employment_terms_path, "post" do
    end
  end
end
