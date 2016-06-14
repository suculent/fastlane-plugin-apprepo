module Fastlane
  module Actions
    class InitAction < Action
      def self.run(_params)
        #sh 'bundle exec rubocop -D'
         command :init do |c|
          c.syntax = 'apprepo init'
          c.description = 'Create the initial `apprepo` configuration'
          c.action do |_args, options|
            if File.exist?('Repofile') || File.exist?('fastlane/Repofile')
              UI.important('You already got a running apprepo setup.')
              return 0
            end

            require 'apprepo/setup'
            config = FastlaneCore::Configuration
            available_opts = AppRepo::Options.available_options
            options = config.create(available_opts, options.__hash__)
            AppRepo::Runner.new(options)
            AppRepo::Setup.new.run(options)
          end
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Initializes Repofile'
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
