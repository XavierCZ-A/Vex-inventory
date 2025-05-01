require 'rails_helper'

RSpec.describe PaymentTerm, type: :model do
  describe 'associations' do
    it { should have_many(:orders) }
  end

  describe 'scopes' do
    it 'returns active payment terms' do
      create(:payment_term, active: true)
      create(:payment_term, active: false)
      expect(PaymentTerm.active.count).to eq(1)
    end
  end
end
