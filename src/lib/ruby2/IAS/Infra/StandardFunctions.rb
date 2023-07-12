#!/usr/bin/ruby

module IAS; end
module Infra; end

require 'date'

module IAS::Infra::StandardFunctions

	def get_output_file_name(options = {})

		options['ending'] ||= 'generic.txt'
		options['ScriptName_subdir'] ||= false
		current_time = DateTime.now
		output_file_date = current_time.strftime('%Y-%m-%d-%H-%M-%S')
		output_dir = self.output_dir()
		
		file_name = \
			output_file_date \
			+ '--' \
			+ self.ScriptName \
			+ '--' \
			+ options['ending']

		elements = [output_dir];

		if options['ScriptName_subdir']
			elements.push(self.ScriptName)
		end
	
		elements.push(file_name)

		return File.join(elements.flatten)
		
	end

	
end
