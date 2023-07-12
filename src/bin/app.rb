#!/usr/bin/ruby

# maybe we should do something like:
# $:.unshift('/opt/IAS/lib/ruby2') unless $:.include?('/opt/IAS/lib/ruby2')

realbin = $0
if File.lstat(realbin).symlink?
	realbin=File.readlink($0)
end

$:.unshift('/opt/IAS/lib/ruby2')
$:.unshift(File.expand_path('../lib/ruby2/',File.dirname(realbin)))

require 'IAS/Infra'
require 'fileutils'

class MyIASApp < IAS::Infra 
	def main

		# Generic output file:
		output_file_name = self.get_output_file_name()

		# Output file with extension
		# output_file_name = self.get_output_file_name({'ending' => 'ending.csv'})

		# Include the script name as a subdirectory
		# output_file_name = self.get_output_file_name({'ScriptName_subdir' => true})
		# FileUtils.mkpath(File.dirname(output_file_name))
	
		fh = File.new(output_file_name, 'w') \
			or raise StandardError
		
		fh.write("Hello.\n");
		fh.close()	

	end

	def demo_logging
		log_debug("This is a debug message.")
		log_info("This is an info message.")
		log_notice("This is a notice message.")
		log_warning("This is a warning message.")
		log_critical("This is a critical message.")
		log_error("This is an error message.")
		log_alert("This is an alert message.")

		# log_emergency("This is an emergency message.")
		log_eprint("This message goes to stderr.")
		
		self.debug_IAS_Infra()
	end

end

app = MyIASApp.new

app.run()
