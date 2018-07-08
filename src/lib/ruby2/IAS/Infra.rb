
module IAS; end
class IAS::Infra; end

require 'IAS/Infra/Logger'
require 'IAS/Infra/FindBin'
require 'IAS/Infra/FullProjectPaths'

class IAS::Infra

	include IAS::Infra::Logger
	include IAS::Infra::FindBin
	include IAS::Infra::FullProjectPaths
	
	# @@debug_IAS_Infra = true;
	@@debug_IAS_Infra = false;
	def run()
		# Admittedly, I don't know the best way
		# to initialize these things (for now)
		self.setup_IAS_infra_logging()
		self.setup_IAS_infra_FindBin()
		self.setup_IAS_Infra_FullProjectPaths()
			
		if @@debug_IAS_Infra
			self.debug_IAS_infra()
		end
		
		self.log_start()
		
		self.main()
		
		self.log_end()
	end
	
	def debug_IAS_Infra()
		self.debug_FindBin()
		self.debug_FullProject_Paths
	end
	
	def log_start
		# TODO: Make this log begin date, end date, options, etc
		self.log_info("Starting Ruby application\n")
	end
	
	def log_end
		self.log_info("Ending Ruby application\n")
	end
end

