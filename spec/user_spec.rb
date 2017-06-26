require 'spec_helper'
require './models/user.rb'

RSpec.describe User do
  describe 'greet' do
    let(:user) { User.new(name: 'たろう', age: age) }
    subject { user.greet }
    context '12歳以下の場合' do
      let(:age) { 12 }
      it { is_expected.to eq 'ぼくはたろうだよ。' }
    end
    
    context '13以上の場合' do
      let(:age) { 13 }
      it { is_expected.to eq '僕はたろうです。' }
    end
  end
end
