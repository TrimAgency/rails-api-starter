require 'rails_helper'

RSpec.describe Tagging, type: :model do
  subject { build :tagging }

  it 'has a valid factory' do
    expect(build :tagging).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:post) }

    it { is_expected.to validate_presence_of(:tag) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:post) }

    it { is_expected.to belong_to(:tag) }
  end
end
