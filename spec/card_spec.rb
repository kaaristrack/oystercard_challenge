require 'card'
require 'journey'

describe Card do
  subject(:card) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:current_journey) { double :current_journey }

  describe '#initialize' do
    it 'defaults to an empty journey_history' do
      expect(card.journey_history).to be_empty
    end

    it 'initiates a new journey object' do
      expect(card.current_journey).to be_an_instance_of(Journey)
    end

    context 'when passed an argument' do
      subject(:card) { described_class.new(Card::MIN_BALANCE) }
      it 'balance equals argument' do
        expect(card.balance).to eq Card::MIN_BALANCE
      end
    end

    context 'when not passed argument' do
      it 'balance equals default balance' do
        expect(card.balance).to eq Card::DEFAULT_BALANCE
      end
    end
  end

  describe '#top_up' do
    context 'when passed an argument' do
      it 'tops up the oyster card' do
        expect { card.top_up(Card::MIN_BALANCE) }.to change { card.balance }.by(Card::MIN_BALANCE)
      end
    end

    context 'when balance exceeds maximum limit' do
      it 'raises an error when top-up limit is exceeded' do
        error_message = "Maximum balance of #{Card::MAX_BALANCE} exceeded!"
        top_up_amount = Card::MAX_BALANCE - card.balance + 1
        expect { card.top_up(top_up_amount) }.to raise_error error_message
      end
    end
  end

  describe '#touch_in' do
    context 'when the balance is too low' do
      it 'raises an error when the balance is less than the minumum amount' do
        allow(card).to receive(:balance).and_return(0)
        low_credit = 'There is not enough credit on your card!'
        expect { card.touch_in(entry_station) }.to raise_error low_credit
      end
    end
  end

  describe '#touch_out' do
    before(:each) do
      card.top_up(Card::DEFAULT_BALANCE)
      card.touch_in(entry_station)
    end

    context 'when called' do
      it 'saves a complete journey and stores to journey_history' do
        expect { card.touch_out(exit_station) }.to change { card.journey_history.count }.by(1)
      end

      it 'deducts fare from the oyster card' do
        expect { card.touch_out(exit_station) }.to change { card.balance }.by(-Journey::MINIMUM_FARE)
      end
    end
  end
end
