require 'spec_helper'

describe BoundaryDays do
  shared_examples 'common behaviors' do
    context 'without options' do
      it { is_expected.not_to be_empty }
    end
  end

  context '.all' do
    context '.build' do
      subject { BoundaryDays.all.build }
      include_examples 'common behaviors'
    end
  end

  context '.week' do
    context '.build' do
      subject { BoundaryDays.week.build }
      include_examples 'common behaviors'
    end

    context '.beginning_of_week_wday' do
      subject { BoundaryDays.week.beginning_of_week_wday(2).build }
      include_examples 'common behaviors'

      it 'start with wday 2' do
        expect(subject.find { |date|date.wday == 2 } ).not_to eq nil
      end
    end

    context '.end_of_week_wday' do
      subject { BoundaryDays.week.end_of_week_wday(4).build }
      include_examples 'common behaviors'

      it 'end with wday 4' do
        expect(subject.find { |date|date.wday == 4 } ).not_to eq nil
      end
    end
  end

  context '.month' do
    context '.build' do
      subject { BoundaryDays.month.build }
      include_examples 'common behaviors'
    end
  end
end
