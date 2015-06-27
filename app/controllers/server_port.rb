class ServerPort

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    response_body = env["PATH_INFO"] == "/about" ?
      "" : env["SERVER_PORT"]
    [status, headers, response << response_body]
  end
end
