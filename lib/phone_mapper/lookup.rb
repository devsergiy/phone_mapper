module PhoneMapper
  class Lookup
    MIN_WORD_LEN = 3

    def initialize(phone)
      @phone = phone
      @dict = PhoneMapper::Dictionary.new()
    end

    def matches
      @dict.open
      results = find_match(@phone)
      @dict.close

      results.reject! do |mapping|
        str = mapping.is_a?(Array) ? mapping.join : mapping
        str.length < 10
      end

      results
    end

    def find_match(sequence)
      if sequence.length < MIN_WORD_LEN * 2
        return @dict.get(sequence) || []
      end

      results = []
      (MIN_WORD_LEN..sequence.length).each do |initial_length|
        first_part = sequence[0, initial_length]
        last_part = sequence[initial_length, sequence.length]

        words = @dict.get(first_part)
        next unless words

        tails = find_match(last_part)

        words.each do |word|
          if tails.any?
            tails.each do |tail|
              results << [word, tail].flatten
            end
          else
            results << word
          end
        end
      end

      results
    end
  end
end
