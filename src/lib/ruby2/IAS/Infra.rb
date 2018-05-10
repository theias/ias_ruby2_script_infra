
module IAS; end
class IAS::Infra; end

require 'IAS/Infra/Logger'

class IAS::Infra
	include IAS::Infra::Logger
	def run()
		setup_IAS_infra_logging()
		puts "Running your application.\n"
		self.main()
	end
end

