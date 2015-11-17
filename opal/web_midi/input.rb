module WebMidi
  class Input
    include Native

    alias_native :connection
    alias_native :manufacturer
    alias_native :name
    alias_native :state
    alias_native :type
    alias_native :version

    def initialize(input)
      super(input)
    end

    def on_change_state(&block)
      `#{@native}.onchangestate = #{block}`
    end

    def on_message(&block)
      callback = lambda do |message|
        block.call Message.new(message)
      end
      `#{@native}.onmidimessage = #{callback}`
    end

    def send(*_args)
      fail "Can't send messages to Input"
    end
  end
end
