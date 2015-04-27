require 'rails_helper'

RSpec.describe Receipt, type: :model do
  # - Variables ---------------------------------------------------------------#
  let(:receipt) { FactoryGirl.create(:receipt) }
  let(:now) { Timecop.freeze(Time.zone.now) }

  # - Fields ------------------------------------------------------------------#
  # -- 1. amount --------------------------------------------------------------#
  describe 'amount' do
    subject { receipt }
    it { is_expected.to validate_presence_of(:amount) }
  end

  # -- 2. date ----------------------------------------------------------------#
  describe 'date' do
    subject { receipt.date.is_a?(ActiveSupport::TimeWithZone) }

    it 'is expected to be a \'ActiveSupport::TimeWithZone\'' do
      is_expected.to eq(true)
    end
  end

  # - Methods -----------------------------------------------------------------#
  # -- 1. #month --------------------------------------------------------------#
  describe '#month' do
    context 'when having 2 receipts in this month and 1 two months ago' do
      before do
        2.times { FactoryGirl.create(:receipt) }
        FactoryGirl.create(:receipt, date: (now - 2.months))
      end

      it 'should have 3 total receipts' do
        expect(Receipt.all.count).to eq(3)
      end

      context "@param current month number (#{Time.zone.now.month}) as param" do
        subject { Receipt.month(now.month) }

        it 'should find 2 receipts' do
          expect(subject.count).to eq(2)
        end
      end

      context "@param month number from 2 months ago (#{(Time.zone.now - 2.months).month}) as param" do
        subject { Receipt.month((now - 2.months).month) }

        it 'should find 1 receipt for the month' do
          expect(subject.count).to eq(1)
        end
      end
    end
  end
end
