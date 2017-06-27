require 'spec_helper'
require './models/shopping_cart.rb'
require './models/lottery.rb'

RSpec.describe 'matcher' do
  describe '#to' do
    it { expect(1 + 2).to eq 3 }
  end
  describe '#not_to' do
    it { expect(1 + 2).not_to eq 1 }
  end
  describe '#eq' do
    it { expect(1 + 2).to eq 3 }
  end
  describe '#be' do
    context 'user >=' do
      it { expect(1 + 2).to be >= 3 }
    end
    context 'equal' do
      let(:message01) { 'Hello' }
      let(:message02) { 'Hello' }
      it { expect([message01].first).to be message01 }
      it { expect([message01].first).not_to be message02 }
      it { expect([message01].first).to eq message02 }
    end
    context 'bool' do
      it do
        expect(true).to be true
        expect(false).to be false
        expect(nil).to be nil
        expect(1 + 1).to be 2
        expect(:foo).to be :foo
      end
    end
  end
  describe '#be_xxx' do
    it { expect([]).to be_empty }
  end
  describe '#be_truthy' do
    it do
      expect(true).to be_truthy
      expect(1).to be_truthy
      expect(1).not_to be true
      expect(1).not_to eq true
    end
  end
  describe '#be_falsey' do
    it do
      expect(false).to be_falsey
      expect(nil).to be_falsey
      expect(nil).not_to be false
      expect(nil).not_to eq false
    end
  end
  describe '#change' do
    let(:x){ [1, 2, 3] }
    it { expect{ x.pop }.to change{ x.size }.from(3).to(2) }
    it { expect{ x.pop }.to change{ x.size }.by(-1) }
    it { expect{ x.push(10) }.to change{ x.size }.by(1) }
  end
  describe '#include' do
    let(:x){ [1, 2, 3] }
    it { expect(x).to include 1 }
    it { expect(x).to include 1, 3 }
  end
  describe '#raise_error' do
    it { expect{ 1/0 }.to raise_error ZeroDivisionError }
    it 'nilを追加するとエラーが発生すること' do
      cart = ShoppingCart.new
      expect{ cart.add nil }.to raise_error 'Item is nil.'
    end
  end
  describe '#be_within' do
    it '当選確率が役25%になっている' do
      results = Lottery.genereate_results(10000)
      win_count = results.count(&:win?)
      probability = win_count.to_f / 10000 * 100

      expect(probability).to be_within(1.0).of(25.0)
    end
  end
end
