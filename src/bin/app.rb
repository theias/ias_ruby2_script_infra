#!/usr/bin/ruby

# maybe we should do something like:
# $:.unshift('/opt/IAS/lib/ruby2') unless $:.include?('/opt/IAS/lib/ruby2')

realbin=__FILE__
if File.lstat(realbin).symlink?
	realbin=File.readlink(__FILE__)
end

$:.unshift('/opt/IAS/lib/ruby2')
$:.unshift(File.expand_path('../lib/ruby2/',File.dirname(realbin)))

require 'IAS/Infra'

class MyIASApp < IAS::Infra 
	def main
		puts "Main app!"
				
		log_debug("This is a debug message.")
		log_info("This is an info message.")
		log_notice("This is a notice message.")
		log_warning("This is a warning message.")
		log_critical("This is a critical message.")
		log_error("This is an error message.")
		log_alert("This is an alert message.")
		log_emergency("This is an emergency message.")
		log_eprint("This message goes to stderr.")

	end
end

app = MyIASApp.new

app.run()
