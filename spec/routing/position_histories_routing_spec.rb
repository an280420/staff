require "rails_helper"

RSpec.describe PositionHistoriesController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/position_histories/new").to route_to("position_histories#new")
    end

    it "routes to #create" do
      expect(post: "/position_histories").to route_to("position_histories#create")
    end
  end
end
