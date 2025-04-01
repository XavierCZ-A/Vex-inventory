require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:organization) { create(:organization) }
  let(:supplier) { create(:supplier, organization: organization) }
  let(:payment_term) { create(:payment_term) }
  let(:order) { create(:order, supplier: supplier, payment_term: payment_term, organization: organization) }

  describe 'associations' do
    it { should belong_to(:supplier) }
    it { should belong_to(:payment_term) }
    it { should have_many(:order_items).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:delivery_date) }
    it { should validate_presence_of(:supplier_id) }
    it { should validate_presence_of(:order_date) }
    it { should validate_presence_of(:payment_term_id) }
    it { should define_enum_for(:status).with_values([ :pending, :shipped, :delivered, :cancelled ]) }
  end

  describe '#generate_order_number' do
    it 'generates a unique order number' do
      order1 = create(:order, supplier: supplier, payment_term: payment_term, organization: organization)
      order2 = create(:order, supplier: supplier, payment_term: payment_term, organization: organization)

      expect(order1.order_number).to start_with("PO-#{Date.today.year}-")
      expect(order2.order_number).to start_with("PO-#{Date.today.year}-")
      expect(order1.order_number).not_to eq(order2.order_number)
    end

    it 'generates sequential order numbers' do
      order1 = create(:order, supplier: supplier, payment_term: payment_term, organization: organization)
      order2 = create(:order, supplier: supplier, payment_term: payment_term, organization: organization)

      sequence1 = order1.order_number.split('-').last.to_i
      sequence2 = order2.order_number.split('-').last.to_i

      expect(sequence2).to eq(sequence1 + 1)
    end
  end

  # describe 'total calculations' do
  #   let!(:order_item1) { create(:order_item, order: order, quantity: 2, price: 10) }
  #   let!(:order_item2) { create(:order_item, order: order, quantity: 3, price: 20) }

  #   it 'calculates the subtotal correctly' do
  #     expect(order.subtotal).to eq(80)
  #   end

  #   it 'calculates the tax amount correctly' do
  #     expect(order.tax_amount).to eq(12.8) # 80 * 0.16 = 12.8
  #   end

  #   it 'calculates the total correctly' do
  #     expect(order.total).to eq(92.8) # 80 + 12.8 = 92.8
  #   end
  # end
end
