require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

DND_INSIDER_CREDENTIALS = begin
  Psych.load_file(File.join(Rails.root, "config", "dnd_insider.yml"))
rescue
  puts "You should edit config/dnd_insider.sample.yml to set your credentials."
  {"email" => "", "password" => ""}
end
