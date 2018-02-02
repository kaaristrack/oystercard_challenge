require 'card'
require 'journey'

# NOTHING WORKS, EVERYTHING SUCKS.

describe Card do
  subject(:card) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  describe '#initialize' do
    it 'defaults to an empty journey history' do
      expect(card.journey_history).to be_empty
    end

    it 'initiates a new journey object' do
      expect(card.current_journey).to be_an_instance_of(Journey)
    end

    context 'when passed an argument' do
      subject(:card) { described_class.new(Card::MIN_BALANCE) }
      it 'the current balance equals the provided argument value' do
        expect(card.balance).to eq Card::MIN_BALANCE
      end
    end

    context 'when not passed argument' do
      it 'the current balance is set to the default value' do
        expect(card.balance).to eq Card::DEFAULT
      end
    end
  end

  describe '#top_up' do
    context 'when passed an argument' do
      it 'increments the current balance' do
        expect { card.top_up(Card::MIN_BALANCE) }.to change { card.balance }.by(Card::MIN_BALANCE)
      end
    end

    context 'when balance exceeds maximum limit' do
      it 'raises an error when the maximum balance is exceeded' do
        error_message = "Maximum balance of #{Card::MAX_BALANCE} exceeded!"
        top_up_amount = Card::MAX_BALANCE - card.balance + 1
        expect { card.top_up(top_up_amount) }.to raise_error error_message
      end
    end
  end

  describe '#touch_in' do
    context 'when the balance is too low' do
      it 'raises an error when the current balance is less than the minimum balance' do
        allow(card).to receive(:balance).and_return(0)
        low_credit = 'There is not enough credit on your card!'
        expect { card.touch_in(entry_station) }.to raise_error low_credit
      end
    end
  end

  describe '#touch_out' do
    before do |test|
      unless test.metadata[:skip_before]
      card.top_up(Card::DEFAULT)
      card.touch_in(entry_station)
      end
    end

    context 'when called' do
      it 'stores the current journey to journey_history (if complete)' do
        expect { card.touch_out(exit_station) }.to change { card.journey_history.count }.by(1)
      end

      it 'deducts an minimum fare from the current balance' do
        expect { card.touch_out(exit_station) }.to change { card.balance }.by(-Journey::MIN_FARE)
      end

      it 'deducts a penalty fare from the current balance', :skip_before do
        expect { card.touch_out(exit_station) }.to change { card.balance }.by(-Journey::PENALTY_FARE)
      end
    end
  end
end
