class RandomNumber
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    response_body = env["PATH_INFO"] == "/about" ?
      "" : rand(100).to_s
    [status, headers, response << response_body]
  end
end
