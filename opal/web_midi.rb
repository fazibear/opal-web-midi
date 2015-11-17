module WebMidi
  Navigator = Native(`navigator`)

  def self.request_access(options = {}, &block)
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
