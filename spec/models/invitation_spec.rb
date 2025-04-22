require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe 'associations' do
    it { should belong_to(:organization) }
    it { should belong_to(:recipient).class_name('User').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(pending: 0, accepted: 1, rejected: 2) }
  end
end
