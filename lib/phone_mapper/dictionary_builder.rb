require 'zip'

module PhoneMapper
  class DictionaryBuilder
    def initialize
      @dictionary = PhoneMapper::Dictionary.new
    end

    def prepare
      read_zip

      @mappings = {}

      @entries.split("\n").each do |entry|
        next if entry.length < 3
        mapping_key = PhoneMapper::Mapping.word_mapping(entry)

        words_for_key = @mappings.fetch(mapping_key, [])
        words_for_key << entry

        @mappings[mapping_key] = words_for_key
      end

      save_data
      puts 'finish creating dictionary'
    end

    private

    def save_data
      @dictionary.open
      @dictionary.clear

      @mappings.each_pair do |key, words_for_key|
        @dictionary.put key, words_for_key
      end

      @dictionary.close
    end

    def read_zip
      Zip::File.open('./data/dictionary.zip') do |zip_file|
        entry = zip_file.glob('dictionary.txt').first
        @entries = entry.get_input_stream.read
      end
    end
  end
end
