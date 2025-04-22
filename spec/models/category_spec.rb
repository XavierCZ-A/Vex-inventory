require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Associations' do
    it 'has many products' do
      organization = create(:organization)
      category = create(:category)

      product1 = create(:product, category: category, organization: organization)
      product2 = create(:product, category: category, organization: organization)

      category.reload
      expect(category.products).to include(product1, product2)
    end
  end
end
