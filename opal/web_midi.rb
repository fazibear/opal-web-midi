module WebMidi
  Navigator = Native(`navigator`)

  def self.support?
    Native(`navigator.requestMIDIAccess !== undefined`)
  end

  def self.request_access(options = {}, &block)
    raise "WebMIDI not supported" unless support?

    success = lambda do |access|
      block.call Access.new(access)
    end

    failure = lambda do |e|
      fail e
    end

    Navigator
      .requestMIDIAccess(options)
      .then(success, failure)
  end

  def self.new(options = {}, &block)
    self.request_access(options, &block)
  end
end
