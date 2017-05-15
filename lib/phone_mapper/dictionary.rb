require 'moneta'

module PhoneMapper
  class Dictionary
    def open
      @closed = false
      @store = Moneta.new(:LevelDB, dir: 'data/dict')
    end

    def close
      @closed = true
      @store.close
    end

    def clear
      check_closed
      @store.clear
    end

    def put(key, value = [])
      check_closed
      @store[key] = value
    end

    def get(key)
      check_closed
      @store[key]
    end

    private
    def check_closed
      raise 'closed' if @closed
    end
  end
end
