require 'rails_helper'

RSpec.describe Supplier, type: :model do
  let(:organization) { create(:organization) }
  let(:supplier) { create(:supplier, organization: organization) }

  describe 'associations' do
    it { should have_many(:orders).dependent(:destroy) }
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:company_name) }
    it { should validate_length_of(:company_name).is_at_least(2) }
    it { should allow_value("TestCompany").for(:company_name) }
    it { should_not allow_value("TestCompany123").for(:company_name).with_message(:invalid) }

    it { should validate_presence_of(:supplier_name) }
    it { should validate_length_of(:supplier_name).is_at_least(2) }
    it { should allow_value("John Doe").for(:supplier_name) }
    it { should_not allow_value("John Doe123").for(:supplier_name).with_message(:invalid) }

    it { should validate_presence_of(:supplier_phone) }
    it { should validate_length_of(:supplier_phone).is_at_most(10) }
    it { should allow_value("1234567890").for(:supplier_phone) }
    it { should_not allow_value("12345678901").for(:supplier_phone) }

    it { should validate_presence_of(:supplier_email) }
    # it { should validate_uniqueness_of(:supplier_email).scoped_to(:organization_id).case_insensitive }
    it { should allow_value("john.doe@example.com").for(:supplier_email) }
    it { should_not allow_value("invalid_email").for(:supplier_email).with_message(:invalid) }

    it { should validate_presence_of(:supplier_address) }
  end
end
