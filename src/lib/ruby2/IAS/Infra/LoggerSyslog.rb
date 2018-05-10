require 'syslog/logger'

module IAS; end
class IAS::Infra; end

module IAS::Infra::LoggerSyslog

	def setup_IAS_infra_logging()
		@log_object = Syslog::Logger.new $0
		@log_to_stderr = false
	end

	def log_debug(message)
		if @log_to_stderr
			log_eprint('LOG_DEBUG', message)		
		end
		@log_object.debug(message)
	end


	def log_info(message)
		if @log_to_stderr
			log_eprint('LOG_INFO', message)		
		end
		@log_object.info(message)
	end
	
	# "warn" maps to notice... wow
	def log_notice(message)
		if @log_to_stderr
			log_eprint('LOG_NOTICE', message)		
		end
		@log_object.warn(message)
	end

	# "error" maps to warning... wow.
	def log_warning(message)
		if @log_to_warning
			log_eprint('LOG_WARNING', message)		
		end
		@log_object.error(message)
	end

	# They say in the manual for syslog that ruby apps can't ever be critical
	# so, we map that to fatal.
	def log_critical(message)
		if @log_to_stderr
			log_eprint('LOG_CRITICAL', message)		
		end
		@log_object.fatal("CRITICAL: " + message)
	end

	# fatal maps to error.
	def log_error(message)
		if @log_to_stderr
			log_eprint('LOG_ERROR', message)		
		end
		@log_object.fatal(message)
	end

	# Ugh.  unknown is mapped to alert
	def log_alert(message)
		if @log_to_stderr
			log_eprint('LOG_ALERT', message)		
		end
		@log_object.unknown(message)
	end

	# They don't define an emergency level.
	def log_emergency(message)
		if @log_to_stderr
			log_eprint('LOG_EMERGENCY', message)		
		end
		@log_object.fatal(message)
	end
	
	def log_eprint(message)
		$stderr.puts(message)
	end
end
