
module IAS; end
class IAS::Infra; end

require 'IAS/Infra/Logger'
require 'IAS/Infra/FindBin'

class IAS::Infra
	include IAS::Infra::Logger
	include IAS::Infra::FindBin
	def run()
		self.setup_IAS_infra_logging()
		self.setup_IAS_infra_FindBin()
		self.log_info("Startin Ruby application\n")
		self.debug_IAS_infra()
		self.main()
		self.log_info("Ending Ruby application\n")
	end
	
	def debug_IAS_infra()
		self.debug_FindBin()
	end
end

