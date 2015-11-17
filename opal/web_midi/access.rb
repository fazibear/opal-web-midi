module WebMidi
  class Access
    include Native

    def initialize(access)
      super(access)
    end

    def inputs
      values_from_iterator(Input, `#{@native}.inputs`)
    end

    def outputs
      values_from_iterator(Output, `#{@native}.outputs`)
    end

    def values_from_iterator(clazz, iterator)
      values = `#{iterator}.values()`
      size = `#{iterator}.size`
      size.times.inject([]) do |out, _i|
        out << clazz.new(`#{values}.next().value`)
      end
    end
  end
end
