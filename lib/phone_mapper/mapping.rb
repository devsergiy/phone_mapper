module PhoneMapper
  module Mapping
    LETTERS = {
      2 => ["a", "b", "c"],
      3 => ["d", "e", "f"],
      4 => ["g", "h", "i"],
      5 => ["j", "k", "l"],
      6 => ["m", "n", "o"],
      7 => ["p", "q", "r", "s"],
      8 => ["t", "u", "v"],
      9 => ["w", "x", "y", "z"],
    }

    def self.letters_to_digits
      LETTERS.inject({}) do |map, (k, v)|
        v.each {|letter| map[letter] = k }
        map
      end
    end
  end
end
