require 'rails_helper'

RSpec.describe Consumer, type: :model do
  subject { build :consumer }

  it 'has a valid factory' do
    expect(build :consumer).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:user) }
  end
end
