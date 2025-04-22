require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'associations' do
    it { should have_many(:users).dependent(:destroy) }
    it { should have_many(:invitations).dependent(:destroy) }
    it { should have_many(:customers).dependent(:destroy) }
    it { should have_many(:products).dependent(:destroy) }
    it { should have_many(:warehouses).dependent(:destroy) }
    it { should have_many(:orders).dependent(:destroy) }
    it { should have_many(:suppliers).dependent(:destroy) }
    it { should have_many(:stock_movements).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for(:users) }
  end
end
