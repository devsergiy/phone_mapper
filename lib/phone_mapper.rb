require "phone_mapper/version"
require "phone_mapper/dictionary"
require "phone_mapper/dictionary_builder"
require "phone_mapper/lookup"
require "phone_mapper/mapping"


module PhoneMapper
  def self.prepare_dictionary
    if Dir.exists?('data/dict')
      puts 'dict present'
    else
      puts 'creating dict'
      PhoneMapper::DictionaryBuilder.new.prepare
    end
  end

  def self.lookup(phone)
    PhoneMapper::Lookup.new(phone).find_match
  end
end
