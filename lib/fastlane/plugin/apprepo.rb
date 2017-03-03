#!/usr/bin/env ruby

# encoding: utf-8

require 'json'
require 'fastlane'
require 'fastlane_core'

require_relative 'apprepo/version'

module Fastlane
  # Root module of the plugin (seems like a class-loader)
  module Apprepo
    # Return all .rb files inside the "actions" and "helper" directory
    def self.all_classes
      Dir[File.expand_path('*/{actions,helper}/*.rb', File.dirname(__FILE__))]
    end
  end

  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8

  # By default we want to import all available actions and helpers
  # A plugin can contain any number of actions and plugins
  Fastlane::Apprepo.all_classes.each do |current|
    require current
  end

  # Test only, should be removed...
  # UI.message('[apprepo.rb]: Initializing new CommandsGenerator')
  # cgen = Apprepo::CommandsGenerator.new
  # UI.message('[apprepo.rb]: Downloading Manifest...')
  # cgen.download_manifest
  # UI.message('[apprepo.rb]: Running Deployment...')
  # cgen.run
end
