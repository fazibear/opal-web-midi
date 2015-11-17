module WebMidi
  class Output
    include Native

    alias_native :connection
    alias_native :manufacturer
    alias_native :name
    alias_native :state
    alias_native :type
    alias_native :version

    alias_native :send

    def initialize(output)
      super(output)
    end

    def on_change_state(&block)
      `#{@native}.onchangestate = #{block}`
    end
  end
end
