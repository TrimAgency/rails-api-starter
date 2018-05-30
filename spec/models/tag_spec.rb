require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { build :tag }

  it 'has a valid factory' do
    expect(build :tag).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:taggings) }

    it { is_expected.to have_many(:posts) }
  end
end
