require 'rails_helper'

RSpec.describe Stock, type: :model do
  let(:organization) { create(:organization) }
  let(:user) { create(:user, organization: organization) }
  let(:session) { create(:session, user: user) }
  let(:product) { create(:product, organization: organization) }
  let(:warehouse) { create(:warehouse, organization: organization) }
  let(:stock) { create(:stock, product: product, warehouse: warehouse, organization: organization) }

  before do
    Current.session = session
  end

  describe 'associations' do
    it { should belong_to(:product).optional }
    it { should belong_to(:warehouse) }
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity).is_greater_than(0) }

    it { should validate_presence_of(:entry_date) }
    it { should validate_presence_of(:warehouse_id) }
  end

  describe 'scopes' do
    describe '.total_stock' do
      it 'calculates the total quantity of all stocks' do
        create(:stock, quantity: 10, product: product, warehouse: warehouse, organization: organization)
        create(:stock, quantity: 20, product: product, warehouse: warehouse, organization: organization)
        expect(Stock.total_stock).to eq(30)
      end
    end
  end

  describe 'callbacks' do
    it 'creates an initial stock movement after create' do
      expect {
        create(:stock, quantity: 5, product: product, warehouse: warehouse, organization: organization)
      }.to change(StockMovement, :count).by(1)

      movement = StockMovement.last
      expect(movement.movement_type).to eq('initial')
      expect(movement.quantity_change).to eq(5)
      expect(movement.user).to eq(user)
    end

    it 'creates an adjustment stock movement after update' do
       stock_instance = create(:stock, quantity: 10, product: product, warehouse: warehouse, organization: organization)
       expect {
         stock_instance.update(quantity: 15)
        }.to change(StockMovement, :count).by(1)

      movement = StockMovement.last
      expect(movement.movement_type).to eq('adjustment')
      expect(movement.quantity_change).to eq(5)
      expect(movement.user).to eq(user)
    end
  end
end
