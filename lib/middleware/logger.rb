require 'fileutils'
require 'logger'

class AppLogger

  def initialize(app, logfile_path)
    @app = app
    @logfile_path = logfile_path
    initialize_logfile!
    @logger = Logger.new(logfile_path)
  end

  def call(env)
    status, headers, response = @app.call(env)
    @logger.info message(env, status, headers)
    [status, headers, response]
  end

  private

  def message(env, status, headers)
    "\nRequest: #{env['REQUEST_METHOD']} #{env['REQUEST_URI']}\n" \
    "Handler: #{env['simpler.controller'].class}##{env['simpler.action']}\n" \
    "Parameters: #{env['simpler.params']}\n" \
    "Response: #{status} #{headers['Content-Type']} #{env['simpler.render_view']}\n" \
  end

  def initialize_logfile!
    directory_name = File.dirname(@logfile_path)

    FileUtils.mkdir_p(directory_name) unless File.directory?(directory_name)
  end

end
