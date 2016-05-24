# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'fastlane/plugin/apprepo/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-apprepo'
  spec.version       = Fastlane::Apprepo::VERSION
  spec.authors       = ['Matej Sychra']
  spec.email         = ['suculent@me.com']
  spec.summary       = Fastlane::Apprepo::SUMMARY
  spec.description   = Fastlane::Apprepo::DESCRIPTION
  spec.homepage      = 'https://github.com/suculent/fastlane-plugin-apprepo'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']
  
  spec.add_development_dependency 'json', '= 1.8.1'
  spec.add_development_dependency 'rspec', '~> 3.4', '>= 3.4.0'
  spec.add_development_dependency 'fastlane', '~> 1.89'
  spec.add_development_dependency 'pry', '~> 0'
end
