require 'rails_helper'

RSpec.describe Receipt, type: :model do
  # - Variables ---------------------------------------------------------------#
  let(:receipt) { FactoryGirl.create(:receipt) }
  let(:now) { Timecop.freeze(Time.zone.now) }

  # - Before/After hooks ------------------------------------------------------#
  before  { Timecop.freeze(2015, 5, 15, 12, 0, 0) }
  after   { Timecop.return }

  # - Fields ------------------------------------------------------------------#
  # -- 1. amount --------------------------------------------------------------#
  describe 'amount' do
    subject { receipt }
    it { is_expected.to validate_presence_of(:amount) }
  end

  # -- 2. date ----------------------------------------------------------------#
  describe 'date' do
    subject { receipt.date }
    it { is_expected.to be_a(ActiveSupport::TimeWithZone) }
  end

  # - Methods -----------------------------------------------------------------#
  # -- 1. #month --------------------------------------------------------------#
  describe '#month' do
    context 'when having 2 receipts in this month and 1 two months ago' do
      @two_months_ago_number = (Time.zone.now - 2.months).month
      let(:two_months_ago_number) { (Time.zone.now - 2.months).month }

      before do
        2.times { FactoryGirl.create(:receipt) }
        FactoryGirl.create(:receipt, date: (now - 2.months))
      end

      it 'should have 3 total receipts' do
        expect(Receipt.all.count).to eq(3)
      end

      context '@param current month number: 5 (May)' do
        subject { Receipt.month(now.month) }

        it 'should find 2 receipts' do
          expect(subject.count).to eq(2)
        end
      end

      context '@param month number from 2 months ago (March)' do
        subject { Receipt.month((now - 2.months).month) }

        it 'should find 1 receipt for the month' do
          expect(subject.count).to eq(1)
        end

        it 'should have the month number: 3 (March)' do
          expect(subject.first.date.month).to eq(two_months_ago_number)
        end
      end
    end
  end

  # -- 2. #spend_total --------------------------------------------------------#
  describe '#spend_total' do
    subject { Receipt.spend_total }

    context 'when there is 3 receipts with the amount: 10.50' do
      before do
        3.times { FactoryGirl.create(:receipt) }
      end

      it { is_expected.to eq(31.5) }
    end

    context 'when there is 3 receipts with the amount: 13.60' do
      before do
        3.times { FactoryGirl.create(:receipt, amount: 13.60) }
      end
      it { is_expected.to eq(40.8) }
    end
  end

  # -- 4. #default_values -----------------------------------------------------#
  describe '#default_values' do
    describe 'the date of a receipt' do
      context 'when building the receipt, but not saving yet' do
        subject { FactoryGirl.build(:receipt).date }
        it { is_expected.to eq(nil) }
      end

      context 'when saving the receipt, it should have a date' do
        subject { FactoryGirl.create(:receipt).date }
        it { is_expected.not_to eq(nil) }
        it { is_expected.to be_an(ActiveSupport::TimeWithZone) }
      end
    end
  end
end
