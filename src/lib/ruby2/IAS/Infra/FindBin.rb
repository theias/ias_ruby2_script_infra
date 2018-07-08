
module IAS; end
module Infra; end

module IAS::Infra::FindBin
	
	@@dollar_zero = $0

	def setup_IAS_Infra_FindBin()

	end

	def Script
		return File.basename(@@dollar_zero)
	end	
	
	def Bin
		return File.expand_path(File.dirname(@@dollar_zero))
	end
	
	def RealScript
		return File.realpath(@@dollar_zero)
	end
	
	def RealBin
		File.dirname(File.realpath(@@dollar_zero))
	end
	
	def debug_FindBin
		puts "Script:"
		puts self.Script()
		puts "Bin:"
		puts self.Bin()
		puts "RealScript:"
		puts self.RealScript()
		puts "RealBin:"
		puts self.RealBin()
	end
end

