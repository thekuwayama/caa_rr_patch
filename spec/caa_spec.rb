# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Resolv::DNS::Resource::IN::CAA do
  context 'CAA Resource Record initialize' do
    let(:caa) do
      Resolv::DNS::Resource::IN::CAA.new(0.chr, 'issuer', 'letsencrypt.org')
    end

    it 'should return CAA object' do
      expect(caa.flags).to eq "\x00"
      expect(caa.tag).to eq 'issuer'
      expect(caa.value).to eq 'letsencrypt.org'
    end
  end
end
