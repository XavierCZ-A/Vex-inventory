require 'rails_helper'

RSpec.describe "/invitations", type: :request do
  let(:organization) { create(:organization) }
  let(:user) { create(:user, organization: organization, password: 'password') }

  before do
    sign_in(user)
  end

  let(:valid_attributes) {
    {
      email: "test@example.com",
      organization_id: organization.id,
      name: "Test User"
    }
  }

  let(:invalid_attributes) {
    {
      email: "invalid-email",
      organization_id: organization.id,
      name: ""
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Invitation.create! valid_attributes
      get invitations_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_invitation_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Invitation" do
        expect {
          post invitations_url, params: { invitation: valid_attributes }
        }.to change(Invitation, :count).by(1)
      end

      it "redirects to the created invitation" do
        post invitations_url, params: { invitation: valid_attributes }
        expect(response).to redirect_to(invitations_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Invitation" do
        expect {
          post invitations_url, params: { invitation: invalid_attributes }
        }.to change(Invitation, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post invitations_url, params: { invitation: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
