require 'spec_helper'
require './models/user.rb'

RSpec.describe User do
  let(:user) { User.new(name: 'たろう', age: age) }
  shared_context '12歳の場合' do
    let(:age) { 12 }
  end
  shared_context '13歳の場合' do
    let(:age) { 13 }
  end

  describe '#greet' do
    subject { user.greet }

    context '12歳以下の場合' do
      include_context '12歳の場合'
      it { is_expected.to eq 'ぼくはたろうだよ。'}
    end

    context '13以上の場合' do
      include_context '13歳の場合'
      it { is_expected.to eq '僕はたろうです。'}
    end
  end

  describe '#child?' do
    subject { user.child? }
    context '12歳以下の場合' do
      include_context '12歳の場合'
      it { is_expected.to eq true }
    end
    context '12以上簿場合' do
      include_context '13歳の場合'
      it { is_expected.to eq false }
    end
  end
end
