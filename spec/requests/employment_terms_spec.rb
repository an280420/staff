require 'rails_helper'

RSpec.describe "EmploymentTerms", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/employment_terms/create"
      expect(response).to have_http_status(:success)
    end
  end

end
