# frozen_string_literal: true

##
# The Certification Authority Authorization (CAA) DNS Resource Record

# rubocop: disable Style/ClassAndModuleChildren
class Resolv::DNS::Resource::IN::CAA < Resolv::DNS::Resource
  TypeValue = 257 # rubocop: disable Naming/ConstantName
  ClassValue = IN::ClassValue
  ClassHash[[TypeValue, ClassValue]] = self

  def initialize(flags, tag, value)
    # https://tools.ietf.org/html/rfc8659#section-4.1
    #    +0-1-2-3-4-5-6-7-|0-1-2-3-4-5-6-7-|
    #    | Flags          | Tag Length = n |
    #    +----------------|----------------+...+---------------+
    #    | Tag char 0     | Tag char 1     |...| Tag char n-1  |
    #    +----------------|----------------+...+---------------+
    #    +----------------|----------------+.....+----------------+
    #    | Value byte 0   | Value byte 1   |.....| Value byte m-1 |
    #    +----------------|----------------+.....+----------------+
    @flags = flags
    @tag = tag
    @value = value
  end

  ##
  # Critical Flag

  attr_reader :flags

  ##
  # Property identifier

  attr_reader :tag

  ##
  # A sequence of octets representing the Property Value

  attr_reader :value

  # :nodoc:
  def encode_rdata(msg)
    msg.put_bytes(@flags)
    msg.put_string(@tag)
    msg.put_bytes(@value)
  end

  # :nodec:
  def self.decode_rdata(msg)
    flags = msg.get_bytes(1)
    tag = msg.get_string
    value = msg.get_bytes
    new(flags, tag, value)
  end
end
# rubocop: enable Style/ClassAndModuleChildren
