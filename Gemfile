source 'https://rubygems.org'

gem 'rspec_junit_formatter', '0.2.3'
gem 'coveralls', require: false
gem 'fastlane', '>= 2.102.0'

# gemspec

# added to support plugin-manager branch of Fastlane
plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval(File.read(plugins_path), binding) if File.exist?(plugins_path)
