require 'moneta'
require 'json'

module PhoneMapper
  class Dictionary
    def initialize
      @store = Moneta.new(:PStore, dir: '/tmp/moneta', file: 'dict')
      @closed = false
    end

    def close
      @closed = true
      @store.close
    end

    def put(key, value = [])
      check_closed
      @store[key] = value.to_json
    end

    def get(key)
      check_closed
      JSON.parse(store[key]) if store.key?('key')
    end

    private
    def check_closed
      raise 'closed' if @closed
    end
  end
end
