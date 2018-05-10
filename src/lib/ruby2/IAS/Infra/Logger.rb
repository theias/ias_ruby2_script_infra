
module IAS; end
module Infra; end

require 'IAS/Infra/LoggerSyslog'

module IAS::Infra::Logger
	include IAS::Infra::LoggerSyslog
	def write_log_info
		puts "This is a stub for the informational log.\n"
	end
end

