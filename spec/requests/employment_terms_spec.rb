 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/employment_terms", type: :request do
  
  # EmploymentTerm. As you add validations to EmploymentTerm, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      EmploymentTerm.create! valid_attributes
      get employment_terms_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      employment_term = EmploymentTerm.create! valid_attributes
      get employment_term_url(employment_term)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_employment_term_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      employment_term = EmploymentTerm.create! valid_attributes
      get edit_employment_term_url(employment_term)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new EmploymentTerm" do
        expect {
          post employment_terms_url, params: { employment_term: valid_attributes }
        }.to change(EmploymentTerm, :count).by(1)
      end

      it "redirects to the created employment_term" do
        post employment_terms_url, params: { employment_term: valid_attributes }
        expect(response).to redirect_to(employment_term_url(EmploymentTerm.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new EmploymentTerm" do
        expect {
          post employment_terms_url, params: { employment_term: invalid_attributes }
        }.to change(EmploymentTerm, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post employment_terms_url, params: { employment_term: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested employment_term" do
        employment_term = EmploymentTerm.create! valid_attributes
        patch employment_term_url(employment_term), params: { employment_term: new_attributes }
        employment_term.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the employment_term" do
        employment_term = EmploymentTerm.create! valid_attributes
        patch employment_term_url(employment_term), params: { employment_term: new_attributes }
        employment_term.reload
        expect(response).to redirect_to(employment_term_url(employment_term))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        employment_term = EmploymentTerm.create! valid_attributes
        patch employment_term_url(employment_term), params: { employment_term: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested employment_term" do
      employment_term = EmploymentTerm.create! valid_attributes
      expect {
        delete employment_term_url(employment_term)
      }.to change(EmploymentTerm, :count).by(-1)
    end

    it "redirects to the employment_terms list" do
      employment_term = EmploymentTerm.create! valid_attributes
      delete employment_term_url(employment_term)
      expect(response).to redirect_to(employment_terms_url)
    end
  end
end
