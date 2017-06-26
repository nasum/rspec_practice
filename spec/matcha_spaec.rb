require 'spec_helper'

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
end
