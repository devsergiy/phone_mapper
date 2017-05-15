require 'zip'

module PhoneMapper
  class DictionaryBuilder
    def initialize
      @dictionary = PhoneMapper::Dictionary.new

      Zip::File.open('./data/dictionary.zip') do |zip_file|
        entry = zip_file.glob('dictionary.txt').first
        @entries = entry.get_input_stream.read
      end
    end

    def prepare
      @entries.split("\n").each do |entry|
        next if entry.length < 3

        # store
      end
    end
  end
end
