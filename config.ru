class Greeter
  def call(*args)
    raise "WTF"
    [200, {}, ["Hello world!"]]
  end
end

run Greeter.new
