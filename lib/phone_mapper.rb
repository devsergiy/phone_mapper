require "phone_mapper/version"
require "phone_mapper/lookup"
require "phone_mapper/mapping"

module PhoneMapper
  def self.lookup(phone)
    PhoneMapper::Lookup.new(phone).find_match
  end
end
