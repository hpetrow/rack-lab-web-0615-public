class ErbMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    html = File.read("lib/templates/template.html.erb")
    template = ERB.new(html)
    response_body = env["PATH_INFO"] == "/about" ?
      "<h1><a href='/'>Are you lost?</a></h1>" : template.result(binding)
    [status, headers, [response_body]]
  end
end
