require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user) }
  subject { user }

  describe 'username' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_least(3) }
    it { is_expected.to validate_length_of(:username).is_at_most(36) }
  end

  describe 'password' do
    it { is_expected.to have_secure_password }
  end

  describe 'email' do
    it { is_expected.to validate_presence_of(:email) }

    context 'when it has an valid e-mail' do
      it { is_expected.to be_valid }
    end

    context 'when it has an invalid e-mail' do
      before { user.email = 'abc@asd' }
      subject { user }

      it { is_expected.to be_invalid }
    end
  end
end
