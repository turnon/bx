require "bx/version"

class Bx
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

    def lowest_one_bits
      int = self
      Enumerator.new do |e|
        off = 0
        loop do
          lowest = int & -int
          break if lowest == 0
          b_len = lowest.bit_length
          off += b_len
          e << off - 1
          int = int >> b_len
        end
      end
    end
  end

  def initialize
    @hash = Hash.new{ |h, k| h[k] = 0 }
  end

  def []=(key, id)
    @hash[key] |= (1 << id)
  end

  def [](key)
    @hash[key]
  end
end
