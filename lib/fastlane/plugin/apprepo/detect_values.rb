
module Fastlane
  module Apprepo
    # This class is responsible for detecting values from IPA.
    class DetectValues
      def run!(options)
        find_app_identifier(options)
        find_version(options)
      end

      def find_app_identifier(options)
        return if options[:app_identifier]
        if options[:ipa]
          # identifier = Apprepo::Analyser.fetch_app_identifier(options[:ipa])
        end
        options[:app_identifier] = identifier unless identifier.to_s.empty?
        input_message = 'The Bundle Identifier of your App: '
        options[:app_identifier] ||= UI.input(input_message)
      end

      def find_version(options)
        unless options[:ipa].nil?
          opt = Apprepo::Analyser.new(options)
          options[:app_version] ||= opt.fetch_app_version(options[:ipa])
        end
      end
    end
  end
end
