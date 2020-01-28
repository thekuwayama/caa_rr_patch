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

  context 'CAA Resource Record decode' do
    let(:bin) do
      <<~BIN.split.map(&:hex).map(&:chr).join
        00 00 81 80 00 01 00 01     00 00 00 00 06 67 6f 6f
        67 6c 65 03 63 6f 6d 00     01 01 00 01 c0 0c 01 01
        00 01 00 01 51 80 00 0f     00 05 69 73 73 75 65 70
        6b 69 2e 67 6f 6f 67
      BIN
    end

    let(:msg) do
      Resolv::DNS::Message.decode(bin)
    end

    it 'should contain CAA queries' do
      expect(msg.question)
        .to include(->(m) { m[1] == Resolv::DNS::Resource::IN::CAA })
    end

    it 'should contain CAA answers' do
      expect(msg.answer)
        .to include(->(m) { m[2].is_a?(Resolv::DNS::Resource::IN::CAA) })
    end
  end
end
