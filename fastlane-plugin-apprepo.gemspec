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

  spec.add_dependency 'net-ssh', '~> 4.0', '>= 4.0.0'
  spec.add_dependency 'net-sftp', '~> 2.1', '>= 2.1.2'
  spec.add_dependency 'json', '~> 2.0', '>= 2.0.3'

  spec.add_development_dependency 'bundler', '~> 1', '>= 1.14.6'
  spec.add_development_dependency 'rspec', '~> 3.5', '>= 3.5.0'
  spec.add_development_dependency 'pry', '~> 0', '>= 0.10.4'
  spec.add_development_dependency 'rake', '~> 0', '>= 0.9.6'
  spec.add_development_dependency 'rubocop', '~> 0', '>= 0.48.1'
  spec.add_development_dependency 'fastlane', '~> 2.0', '>= 2.20'
end
