module Fastlane
  module Actions
    class SubmitAction < Action
      def self.run(_params)
        #sh 'bundle exec rubocop -D'
        puts _params
        command :submit do |c|
          c.syntax = 'apprepo submit'
          c.description = 'Submit a specific build-nr, use latest.'
          c.action do |_args, options|
            config = FastlaneCore::Configuration
            available_opts = Apprepo::Options.available_options
            options = config.create(available_opts, options.__hash__)
            options.load_configuration_file('Repofile')
            Apprepo::Runner.new(options).run
          end
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Submits IPA to Apprepo'
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
