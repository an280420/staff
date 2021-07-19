 require 'rails_helper'

RSpec.describe "/position_histories", type: :request do
  
  # PositionHistory. As you add validations to PositionHistory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /new" do
    it "renders a successful response" do
      get new_position_history_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PositionHistory" do
        expect {
          post position_histories_url, params: { position_history: valid_attributes }
        }.to change(PositionHistory, :count).by(1)
      end

      it "redirects to the created position_history" do
        post position_histories_url, params: { position_history: valid_attributes }
        expect(response).to redirect_to(position_history_url(PositionHistory.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PositionHistory" do
        expect {
          post position_histories_url, params: { position_history: invalid_attributes }
        }.to change(PositionHistory, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post position_histories_url, params: { position_history: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
