require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:organization) { create(:organization) }
  let(:category) { create(:category) }
  let(:product) { create(:product, category: category, organization: organization) }

  describe 'associations' do
    it { should belong_to(:category) }
    it { should have_many(:stocks) }
    it { should have_many(:warehouses).through(:stocks) }
    it { should have_many(:order_items).dependent(:destroy) }
    it { should have_many(:orders).through(:order_items) }
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should allow_value("Valid Product Name").for(:name) }
    it { should_not allow_value("Invalid!@#").for(:name).with_message(:invalid) }

    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0) }

    it { should validate_presence_of(:category_id) }
  end

  describe 'scopes' do
    describe '.total_products_price' do
      it 'calculates the total price of all products' do
        create(:product, price: 10, organization: organization, category: category)
        create(:product, price: 20, organization: organization, category: category)
        expect(Product.total_products_price).to eq(30)
      end
    end

    describe '.order_by_date' do
      it 'orders products by creation date in descending order' do
        product1 = create(:product, created_at: 2.days.ago, organization: organization, category: category)
        product2 = create(:product, created_at: 1.day.ago, organization: organization, category: category)
        expect(Product.order_by_date).to eq([ product2, product1 ])
      end
    end
  end
end
