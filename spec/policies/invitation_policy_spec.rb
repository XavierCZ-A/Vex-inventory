# spec/policies/invitation_policy_spec.rb
require 'rails_helper'

# Describe la clase de la policy que estás probando
RSpec.describe InvitationPolicy, type: :policy do
  let(:record) { nil }

  subject { described_class.new(user, record) }

  context 'as a non admin user' do
    let(:user) { create(:user, :employee) }

    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:create) }
  end

  context 'as an admin user' do
    let(:user) { create(:user, :admin) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:create) }
  end
end
