require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
  end
end
