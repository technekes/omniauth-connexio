require 'spec_helper'

describe OmniAuth::Strategies::Connexio do
  subject { OmniAuth::Strategies::Connexio.new(nil) }

  describe '#client' do
    it 'has correct Connexio site' do
      expect(subject.client.site).to eq('https://login.connexiolabs.com')
    end

    it 'has correct authorize url' do
      expect(subject.client.options[:authorize_url]).to eq('/oauth/authorize')
    end

    it 'has correct token url' do
      expect(subject.client.options[:token_url]).to eq('/oauth/access_token')
    end
  end

  describe '#callback_path' do
    it 'has the correct callback path' do
      expect(subject.callback_path).to eq('/auth/connexio/callback')
    end
  end

  describe '#uid' do
    before :each do
      allow(subject).to receive(:raw_info) { { 'id' => 'uid' } }
    end

    it 'returns the id from raw_info' do
      expect(subject.uid).to eq('uid')
    end
  end

  describe '#info' do
    context 'and therefore has all the necessary fields' do
      before :each do
        allow(subject).to receive(:raw_info) {
          {
            'first_name'    => 'John',
            'last_name'     => 'Smith',
            'email_address' => 'john.smith@example.com',
            'phone_number'  => '5555551212'
          }
        }
      end

      it { expect(subject.info).to have_key :name }
      it { expect(subject.info).to have_key :email }
      it { expect(subject.info).to have_key :first_name }
      it { expect(subject.info).to have_key :last_name }
      it { expect(subject.info).to have_key :phone }
    end

    context 'and does not fail with empty response' do
      before :each do
        allow(subject).to receive(:raw_info) { {} }
      end

      it { expect { subject.info }.not_to raise_error }
    end
  end

  describe '#extra' do
    before :each do
      allow(subject).to receive(:raw_info) { { 'foo' => 'bar' } }
    end

    it { expect(subject.extra[:raw_info]).to eq({ 'foo' => 'bar' }) }
  end

  describe '#raw_info' do
    before :each do
      response = double(:response, parsed: { 'foo' => 'bar' })

      allow(subject).to receive(:access_token) do
        double('access token', get: response, options: {})
      end
    end

    it 'returns parsed response from access token' do
      expect(subject.raw_info).to eq({ 'foo' => 'bar' })
    end
  end
end
