require 'spec_helper'

describe BoundaryDays do
  shared_examples 'common behaviors' do
    context 'without options' do
      let(:options) { {} }
      it { is_expected.not_to be_empty }
    end

    context 'with options' do
      context 'beginning_of_week_wday' do
        let(:options) { { beginning_of_week_wday: 3 } }
        it { is_expected.not_to be_empty }
      end

      context 'end_of_week_wday' do
        let(:options) { { end_of_week_wday: 4 } }
        it { is_expected.not_to be_empty }
      end
    end
  end

  context '.all' do
    context '.build' do
      subject { BoundaryDays.all(options).build }
      include_examples 'common behaviors'
    end
  end

  context '.week' do
    context '.build' do
      subject { BoundaryDays.week(options).build }
      include_examples 'common behaviors'
    end
  end

  context '.month' do
    context '.build' do
      subject { BoundaryDays.month(options).build }
      include_examples 'common behaviors'
    end
  end
end
