
module IAS; end
class IAS::Infra; end

require 'IAS/Infra/Logger'
require 'IAS/Infra/FindBin'

class IAS::Infra
	include IAS::Infra::Logger
	include IAS::Infra::FindBin
	@@debug_IAS_Infra = true;
	def run()
		# Admittedly, I don't know the best way
		# to initialize these things (for now)
		self.setup_IAS_infra_logging()
		self.setup_IAS_infra_FindBin()
				
		if @@debug_IAS_Infra
			self.debug_IAS_infra()
		end
		
		self.log_start()
		
		self.main()
		
		self.log_end()
	end
	
	def debug_IAS_infra()
		self.debug_FindBin()
	end
	
	def log_start
		self.log_info("Startin Ruby application\n")
	end
	
	def log_end
		self.log_info("Ending Ruby application\n")
	end
end

