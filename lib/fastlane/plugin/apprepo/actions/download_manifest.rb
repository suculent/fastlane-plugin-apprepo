module Fastlane
  module Actions
    class DownloadManifestAction < Action
      def self.run(_params)
        puts _params
        command :download_manifest do |c|
          c.syntax = 'apprepo download_manifest'
          c.description = 'Download metadata only'
          c.action do |_args, options|
            config = FastlaneCore::Configuration
            available_opts = Apprepo::Options.available_options
            options = config.create(available_opts, options.__hash__)
            options.load_configuration_file('Repofile')
            Apprepo::Runner.new(options).download_manifest
          end
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Runs the Apprepo plugin'
      end

      def self.available_options
        []
      end

      def self.authors
        ['suculent@me.com']
      end

      def self.is_supported?(_platform)
        true
      end
    end
  end
end
