require 'json'

module Fastlane
  module AppRepo
    # Responsible for parsing and providing manifest.json
    class Manifest
      #
      # Translated internal key names from Fastlane to AppRepo
      #

      attr_accessor :appcode             # AppRepo Internal Code
      attr_accessor :filename            # IPA file name
      attr_accessor :bundle_identifier   # app_identifier
      attr_accessor :bundle_version      # app_version
      attr_accessor :title               # app_name
      attr_accessor :subtitle            # app_description
      attr_accessor :notify              # will send push notification / slack

      def initialize(appcode)
        self.appcode = appcode
        UI.message('Initializing requires APPCODE. ' + self.appcode)
      end

      def parse_json(json)
        # TODO: load values from JSON
      end

      # Provide JSON serialized data
      def manifest_as_json
        structure = {
          appcode: appcode,
          filename: filename,
          bundle_identifier: bundle_identifier,
          bundle_version: bundle_version,
          title: title,
          subtitle: subtitle,
          notify: notify
        }

        fputs structure
      end
    end
  end
end
