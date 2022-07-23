require "vdx/version"

module Vdx
  class << self
    def highest_one_bits(int)
      Enumerator.new do |e|
        loop do
          b_len = int.bit_length
          break if b_len == 0
          e << b_len
          int = int ^ (1 << (b_len - 1))
        end
      end
    end
  end
end
