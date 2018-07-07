#!/usr/bin/ruby

module IAS; end
module Infra; end

module IAS::Infra::FullProjectPaths

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
		
		puts "We are in src dir?"
		puts self.are_we_in_src_dir()
	end
	
	def are_we_in_src_dir
		bin_whence_dir = self.get_whence_dir()
		path_components = bin_whence_dir.split('/')
		# puts "Path components."
		# puts path_components.join(',')
		# puts "Second to last:"
		# puts path_components[-2]
		return path_components[-2].eql? 'src'
	end
end
