#!/usr/bin/ruby

module IAS; end
module Infra; end

# require 'IAS/Infra/FindBin'

module IAS::Infra::FullProjectPaths

	# include IAS::Infra::FindBin
	@@bin_whence = 'RealBin'
	
	def init_whences
		@@bin_whences = {
			'RealBin' => self.RealBin(),
			'Bin' => self.Bin(),
		}
	end
	
	def get_whence_dir
		self.init_whences()
		return @@bin_whences[@@bin_whence]
	end

	def debug_FullProject_Paths
		puts "Bin whence: "
		puts self.get_whence_dir()
	end
end
