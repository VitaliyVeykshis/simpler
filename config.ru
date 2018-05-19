require_relative 'config/environment'
require_relative 'lib/middleware/logger'

use AppLogger, 'log/app.log'
run Simpler.application
