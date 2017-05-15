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

    @@letters_to_digits =
      LETTERS.inject({}) do |map, (k, v)|
        v.each {|letter| map[letter] = k }
        map
      end

    def self.word_mapping(word)
      word.downcase.split('').map do |letter|
        @@letters_to_digits[letter]
      end.join
    end
  end
end
