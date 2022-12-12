require_relative 'lib/greeter'
require 'rack'

use Rack::Reloader, 0

run Greeter.new
