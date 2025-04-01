require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  let(:organization) { create(:organization) } # Usando FactoryBot para crear una organización
  let(:warehouse) { create(:warehouse, organization: organization) } # Usando FactoryBot para crear un warehouse

  describe 'associations' do
    it { should have_many(:stocks) }
    it { should have_many(:products).through(:stocks) }
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:capacity) }

    it 'validates address format' do
      warehouse.address = 'Invalid Address!'
      expect(warehouse).not_to be_valid
      expect(warehouse.errors[:address]).to include(I18n.t('errors.messages.invalid'))

      warehouse.address = 'Valid Address 123-A, #45'
      expect(warehouse).to be_valid
    end
  end

  describe '#ocupacity_percentage' do
    let(:product1) { create(:product) }
    let(:product2) { create(:product) }

    before do
      create(:stock, warehouse: warehouse, product: product1, quantity: 10)
      create(:stock, warehouse: warehouse, product: product2, quantity: 20)
    end

    it 'calculates the occupancy percentage correctly' do
      warehouse.capacity = 100
      expect(warehouse.ocupacity_percentage).to eq(30.0)

      warehouse.capacity = 50
      expect(warehouse.ocupacity_percentage).to eq(60.0)
    end

    it 'handles no stocks' do
      warehouse.stocks.destroy_all
      warehouse.capacity = 100
      expect(warehouse.ocupacity_percentage).to eq(0.0)
    end
  end
end
