require 'rails_helper'

RSpec.describe EmployeePolicy, type: :policy do
  let(:record) { nil }

  subject { described_class.new(user, record) }

  context 'as an employee' do
    let(:user) { create(:user, :employee) }

    it { is_expected.to forbid_action(:index) }
  end

  context 'as an admin' do
    let(:user) { create(:user, :admin) }

    it { is_expected.to permit_action(:index) }
  end
end
