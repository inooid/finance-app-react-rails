require 'rails_helper'

RSpec.describe Receipt, type: :model do
  context '.by_month' do
    before do
      Timecop.freeze
    end

    context 'when it has receipts' do
      # before do
      #   create(:receipt, date: DateTime.now.beginning_of_month)
      #   create(:receipt, date: DateTime.now.beginning_of_month + 2.days)
      #   create(:receipt, date: DateTime.now.beginning_of_month + 5.weeks)
      #   create(:receipt, date: DateTime.now.beginning_of_month + 2.months)
      #   create(:receipt, date: DateTime.now.beginning_of_month - 1.months)
      # end

      # context 'when no date param' do
      #   subject { Receipt.by_month }

      #   let(:expected) do
      #     [build(:receipt, date: DateTime.now.beginning_of_month),
      #      build(:receipt, date: DateTime.now.beginning_of_month + 2.days)]
      #   end

      #   it 'returns an array with receipts' do
      #     expect(subject).to match_array(expected)
      #   end
      # end

      # context 'when has date param that has DateTime two months from now' do
      #   subject { Receipt.by_month(DateTime.now + 2.months) }

      #   it 'should find one receipt' do
      #     expect(subject.count).to eq(1)
      #   end
      # end
    end
  end
end
