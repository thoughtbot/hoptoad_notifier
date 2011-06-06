module HoptoadNotifier
  class UserInformer
    def initialize(app)
      @app = app
    end

    def replacement(with)
      @replacement ||= HoptoadNotifier.configuration.user_information.gsub(/\{\{\s*error_id\s*\}\}/, with.to_s)
    end

    def call(env)
      status, headers, body = @app.call(env)
      if env['hoptoad.error_id'] && HoptoadNotifier.configuration.user_information
        body = UserInformerStreamer.new(body, replacement(env['hoptoad.error_id']))
      end
      [status, headers, body]
    end
  end
end

