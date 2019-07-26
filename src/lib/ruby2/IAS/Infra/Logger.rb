
module IAS; end
module Infra; end

require 'IAS/Infra/LoggerSyslog'

module IAS::Infra::Logger
	include IAS::Infra::LoggerSyslog
end

