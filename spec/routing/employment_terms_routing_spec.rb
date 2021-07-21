require "rails_helper"

RSpec.describe EmploymentTermsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/employment_terms").to route_to("employment_terms#index")
    end

    it "routes to #new" do
      expect(get: "/employment_terms/new").to route_to("employment_terms#new")
    end

    it "routes to #show" do
      expect(get: "/employment_terms/1").to route_to("employment_terms#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/employment_terms/1/edit").to route_to("employment_terms#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/employment_terms").to route_to("employment_terms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/employment_terms/1").to route_to("employment_terms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/employment_terms/1").to route_to("employment_terms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/employment_terms/1").to route_to("employment_terms#destroy", id: "1")
    end
  end
end
