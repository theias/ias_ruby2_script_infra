
module IAS; end
module Infra; end

module IAS::Infra::FindBin
	
	@@dollar_zero = $0

	def setup_IAS_Infra_FindBin()

	end

	def Script
		return File.basename(@@dollar_zero)
	end	
	
	def ScriptName
		return File.basename(@@dollar_zero,File.extname(@@dollar_zero))
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
		puts "Script(): " + self.Script()
		puts "Bin(): " + self.Bin()
		puts "RealScript: " + self.RealScript()
		puts "RealBin: " + self.RealBin()
	end
end

