require 'rails_helper'

RSpec.describe Receipt, type: :model do
  let(:receipt) { FactoryGirl.build(:receipt) }
  subject { receipt }

  describe 'amount' do
    it { is_expected.to validate_presence_of(:amount) }
  end
end
