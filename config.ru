require_relative 'config/environment'

use ServerPort
use RequestMethod
use RandomNumber
use ErbMaker
run Application.new
