#!/usr/bin/ruby

module IAS; end
module Infra; end

module IAS::Infra::FullProjectPaths

	@@bin_whence = 'RealBin'
	
	def setup_IAS_Infra_FullProjectPaths
		@@bin_whences = {
			'RealBin' => self.RealBin(),
			'Bin' => self.Bin(),
		}
		
		@@bin_whence_dir = self.get_whence_dir()
		@@script_path_components = @@bin_whence_dir.split('/')

		@@script_without_extension = File.basename(
			self.Script(),
			File.extname(self.Script()),
		)

		
		@@are_we_in_src_dir = @@script_path_components[-2].eql? 'src'
	
		if @@are_we_in_src_dir
			@@up_path_components = ['..']
			@@project_name = @@script_path_components[-3]
		else
			@@up_path_components = ['..','..']
			@@installed_package_name = @@script_path_components[-1]
		end		
	end
	
	def get_whence_dir
		return @@bin_whences[@@bin_whence]
	end
	
	def are_we_in_src_dir
		return @@are_we_in_src_dir
	end
	
	def get_generic_project_directory(dir_name)
		if @@are_we_in_src_dir
			join_args = [self.get_whence_dir()]
			join_args.push(@@up_path_components)
			join_args.push(dir_name)
		else
			join_args = [self.get_whence_dir()]
			join_args.push(@@up_path_components)
			join_args.push(dir_name)
			join_args.push(@@installed_package_name)
		end
		return join_args.join('/')
	end

	def bin_dir
		return self.get_whence_dir()
	end
	
	def input_dir
		return self.get_generic_project_directory('input')
	end
	
	def output_dir
		return self.get_generic_project_directory('output')
	end
	
	def conf_dir
		return self.get_generic_project_directory('etc')
	end
	
	def log_dir
		return self.get_generic_project_directory('log')
	end
	
	def script_output_dir
		path_components = [
			self.output_dir(),
			@@script_without_extension
		]
		return path_components.join('/')
	end

	def debug_FullProject_Paths
		puts "Bin whence: "
		puts self.get_whence_dir()
		
		puts "We are in src dir?"
		puts self.are_we_in_src_dir()

		puts "Bin dir: " + self.bin_dir()
		puts "Input dir: " + self.input_dir()
		puts "Output dir: " + self.output_dir()
		puts "Conf dir: " + self.conf_dir()
		puts "Log dir: " + self.log_dir()
		puts "Script output dir: " + self.script_output_dir()
	end
	
end
