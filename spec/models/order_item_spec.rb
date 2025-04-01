require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:organization) { create(:organization) }
  let(:order) { create(:order, organization: organization) }
  let(:product) { create(:product, organization: organization) }
  let(:order_item) { create(:order_item, order: order, product: product, organization: organization) }

  describe 'associations' do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
    it { should belong_to(:organization) }
  end
end
