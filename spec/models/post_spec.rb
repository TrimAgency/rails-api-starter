require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build :post }

  it 'has a valid factory' do
    expect(build :post).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
