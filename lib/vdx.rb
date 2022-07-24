require "vdx/version"

class Vdx
  class ::Integer
    def highest_one_bits
      int = self
      Enumerator.new do |e|
        loop do
          b_len = int.bit_length
          break if b_len == 0
          pos = b_len - 1
          e << pos
          int = int ^ (1 << pos)
        end
      end
    end
  end

  def initialize
    @hash = Hash.new{ |h, k| h[k] = 0 }
  end

  def []=(key, id)
    @hash[key] |= (1 << (id - 1))
  end

  def [](key)
    @hash[key]
  end
end
