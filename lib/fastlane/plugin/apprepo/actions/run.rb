module Fastlane
  module Actions
    class RunAction < Action
      def self.run(_params)
        program :version, AppRepo::VERSION
        program :description, AppRepo::DESCRIPTION
        program :help, 'Author', 'Matej Sychra <suculent@me.com>'
        program :help, 'Website', 'https://github.com/suculent/apprepo'
        program :help, 'GitHub', 'https://github.com/suculent/apprepo/tree/master/apprepo'
        program :help_formatter, :compact

        generator = FastlaneCore::CommanderGenerator.new
        generator.generate(AppRepo::Options.available_options)

        global_option('--verbose') { $verbose = true }

        always_trace!

        puts _params

         command :run do |c|
          c.syntax = 'apprepo'
          c.description = 'Upload IPA and metadata to SFTP (e.g. AppRepo)'
          c.action do |_args, options|
            config = FastlaneCore::Configuration
            available_opts = AppRepo::Options.available_options
            options = config.create(available_opts, options.__hash__)
            loaded = options.load_configuration_file('Repofile')
            loaded = true if options[:repo_description] || options[:ipa]

            unless loaded
              UI.message('[AppRepo::CommandsGenerator] configuration file not loaded')
              if UI.confirm('No Repofile found. Do you want to setup apprepo?')
                require 'apprepo/setup'
                AppRepo::Setup.new.run(options)
                return 0
              end
            end

            AppRepo::Runner.new(options).run
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
