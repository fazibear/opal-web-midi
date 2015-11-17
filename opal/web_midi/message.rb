module WebMidi
  class Message
    include Native

    alias_native :type

    def initialize(message)
      super(message)
    end

    def data
      `#{@native}.data`
    end

    def time_stamp
      `#{@native}.timeStamp`
    end

    def received_at
      `#{@native}.receivedTime`
    end
  end
end
