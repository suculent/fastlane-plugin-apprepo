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

    def initialize
      UI.message('AppRepo:self Initializing...')
    end

    def new
      UI.message('AppRepo:new')
    end

    def download_manifest
      cgen = Apprepo::CommandsGenerator.new
      cgen.download_manifest
    end

    def run
      cgen = Apprepo::CommandsGenerator.new
      cgen.run
    end
end

  # By default we want to import all available actions and helpers
  # A plugin can contain any number of actions and plugins
  Fastlane::Apprepo.all_classes.each do |current|
    puts 'Requiring ' + current
    require current
  end

  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8

  UI.message('Initializing new CommandsGenerator')
  cgen = Apprepo::CommandsGenerator.new
  UI.message('Downloading Manifest...')
    #	  cgen.download_manifest
    #	  UI.message('Running Deployment...')
    #	  cgen.Running

    # Helper = FastlaneCore::Helper
    # UI = FastlaneCore::UI
  end
