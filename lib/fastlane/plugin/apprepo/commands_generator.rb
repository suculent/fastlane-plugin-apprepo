require 'commander'

HighLine.track_eof = false

module Fastlane
  module Apprepo
    # This class is responsible for providing commands with respective actions
    class CommandsGenerator
      include Commander::Methods

      def self.start
        FastlaneCore::UpdateChecker.start_looking_for_update('Apprepo')
        new.run
      ensure
        checker = FastlaneCore::UpdateChecker
        checker.show_update_status('Apprepo', Apprepo::VERSION)
      end

      def download_manifest
        command :download_manifest
      end

      def init
        command :init
      end

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      # rubocop:disable Metrics/CyclomaticComplexity
      # rubocop:disable Metrics/PerceivedComplexity
      # rubocop:disable Style/GlobalVars
      def run
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

        command :run do |c|
          c.syntax = 'Apprepo'
          c.description = 'Upload IPA and metadata to SFTP (e.g. Apprepo)'
          c.action do |_args, options|
            config = FastlaneCore::Configuration
            available_opts = Apprepo::Options.available_options
            options = config.create(available_opts, options.__hash__)
            loaded = options.load_configuration_file('Repofile')
            loaded = true if options[:repo_description] || options[:ipa]

            unless loaded
              UI.message('[Apprepo::CommandsGenerator] configuration file not loaded')
              if UI.confirm('No Repofile found. Do you want to setup Apprepo?')
                require 'Apprepo/setup'
                Apprepo::Setup.new.run(options)
                return 0
              end
            end

            Apprepo::Runner.new(options).run
          end
        end

        command :download_manifest do |c|
          c.syntax = 'Apprepo download_manifest'
          c.description = 'Download metadata only'
          c.action do |_args, options|
            config = FastlaneCore::Configuration
            available_opts = Apprepo::Options.available_options
            options = config.create(available_opts, options.__hash__)
            options.load_configuration_file('Repofile')
            Apprepo::Runner.new(options).download_manifest
          end
        end

        command :submit do |c|
          c.syntax = 'Apprepo submit'
          c.description = 'Submit a specific build-nr, use latest.'
          c.action do |_args, options|
            config = FastlaneCore::Configuration
            available_opts = Apprepo::Options.available_options
            options = config.create(available_opts, options.__hash__)
            options.load_configuration_file('Repofile')
            Apprepo::Runner.new(options).run
          end
        end

        command :init do |c|
          c.syntax = 'Apprepo init'
          c.description = 'Create the initial `Apprepo` configuration'
          c.action do |_args, options|
            if File.exist?('Repofile') || File.exist?('fastlane/Repofile')
              UI.important('You already got a running Apprepo setup.')
              return 0
            end

            require 'Apprepo/setup'
            config = FastlaneCore::Configuration
            available_opts = Apprepo::Options.available_options
            options = config.create(available_opts, options.__hash__)
            Apprepo::Runner.new(options)
            Apprepo::Setup.new.run(options)
          end
        end

        # rubocop:enable Metrics/AbcSize
        # rubocop:enable Metrics/MethodLength

        default_command :run

        run!
      end
    end
  end
end
