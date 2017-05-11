require "phone_mapper/version"
require "phone_mapper/lookup"

module PhoneMapper
  def self.lookup(phone)
    PhoneMapper::Lookup.new(phone).find_match
  end
end
