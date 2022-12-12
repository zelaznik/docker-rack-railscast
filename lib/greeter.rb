require 'rack'
require 'pry'

class Greeter
  def call(env)
    request = Rack::Request.new(env)

    case request.path
      when "/" then
        [
          200,
          { "content-type" => "text/html" },
          [render("index.html.erb")]
        ]
      else
        [
          404,
          { "content-type" => "text/plain" },
          ["Not Found"]
        ]
    end
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
