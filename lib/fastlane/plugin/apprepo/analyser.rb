require 'rubygems'
require 'json'
require 'net/ssh'
require 'net/sftp'
require 'fastlane_core'

require_relative 'uploader'

module Fastlane
  module Apprepo
    # Should provide metadata for current appcode
    class Analyser
      attr_accessor :options

      def initialize(options)
        self.options = options
      end

      # Fetches remote app version from metadata
      def fetch_app_version(options)
        metadata = Apprepo::Uploader.new(options).download_manifest_only
        FastlaneCore::UI.command_output('TODO: Parse version out from metadata')
        puts JSON.pretty_generate(metadata) unless metadata.nil?
        FastlaneCore::UI.important('TODO: parse out the bundle-version')
        metadata['bundle-version']
      end

      # only for testing, should be empty
      def run
        FastlaneCore::UI.message('Analyser run, will fetch_app_version...')
        fetch_app_version(options)
      end
    end
  end
end
