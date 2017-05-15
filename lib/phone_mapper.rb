require "phone_mapper/version"
require "phone_mapper/dictionary"
require "phone_mapper/dictionary_builder"
require "phone_mapper/lookup"
require "phone_mapper/mapping"


module PhoneMapper
  def self.prepare_dictionary
    PhoneMapper::DictionaryBuilder.new.prepare
  end

  def self.lookup(phone)
    PhoneMapper::Lookup.new(phone).find_match
  end
end
