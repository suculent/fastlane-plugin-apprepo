require_relative '../version.rb'

module Fastlane
  module Actions
    class RunAction < Action
      def self.run(_params)
        program :version, Apprepo::VERSION
        program :description, Apprepo::DESCRIPTION
        program :help, 'Author', 'Matej Sychra <suculent@me.com>'
        program :help, 'Website', 'https://github.com/suculent/apprepo'
        program :help, 'GitHub', 'https://github.com/suculent/apprepo/tree/master/apprepo'
        program :help_formatter, :compact

        generator = FastlaneCore::CommanderGenerator.new
        generator.generate(Apprepo::Options.available_options)

        global_option('--verbose') { $verbose = true }

        always_trace!

        puts _params

        command :run do |c|
          c.syntax = 'apprepo'
          c.description = 'Upload IPA and metadata to SFTP (e.g. Apprepo)'
          c.action do |_args, options|
            config = FastlaneCore::Configuration
            available_opts = Apprepo::Options.available_options
            options = config.create(available_opts, options.__hash__)
            loaded = options.load_configuration_file('Repofile')
            loaded = true if options[:repo_description] || options[:ipa]

            unless loaded
              UI.message('[Apprepo::CommandsGenerator] configuration file not loaded')
              if UI.confirm('No Repofile found. Do you want to setup apprepo?')
                require 'apprepo/setup'
                Apprepo::Setup.new.run(options)
                return 0
              end
            end

            Apprepo::Runner.new(options).run
          end
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Runs the default Apprepo action'
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
