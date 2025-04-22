require 'rails_helper'

RSpec.describe StockMovement, type: :model do
  describe 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:warehouse).optional }
    it { should belong_to(:user) }
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:quantity_change) }
    it { should validate_presence_of(:movement_date) }
    it { should validate_presence_of(:organization_id) }
    it { should validate_presence_of(:product_id) }
    it { should validate_presence_of(:movement_type) }
  end

  describe 'enums' do
    it { should define_enum_for(:movement_type).with_values(initial: 0, adjustment: 1, sale: 2, purchase: 3, transfer_in: 4, transfer_out: 5) }
  end
end
