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

  spec_files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.files         = spec_files
  spec.require_paths = ['lib']

# spec.add_runtime_dependency 'fastlane', '~> 0'
  spec.add_runtime_dependency 'net-ssh', '~> 3.1', '>= 3.1.1'
  spec.add_runtime_dependency 'net-sftp', '~> 2.1', '>= 2.1.2'
  spec.add_runtime_dependency 'json', '= 1.8.1'

  spec.add_development_dependency 'rspec', '~> 3.4', '>= 3.4.0'
  spec.add_development_dependency 'pry', '~> 0'
end
