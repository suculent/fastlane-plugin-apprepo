require_relative 'uploader'

module Fastlane
  module Apprepo
    # Responsible for running
    class Runner
      attr_accessor :options

      def initialize(options)
        self.options = options
        Apprepo::DetectValues.new.run!(self.options)
        FastlaneCore::PrintTable.print_values(config: options, hide_keys: [:repo_password], mask_keys: [:repo_key], title: "Apprepo-sftp #{Apprepo::VERSION} Summary")
      end

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/CyclomaticComplexity
      def run
        UI.success('Apprepo SFTP Uploader running...')
        verify_version unless options[:app_version].to_s.empty?
        has_binary = options[:ipa]
        if !options[:skip_binary_upload] && !options[:build_number] && has_binary
          upload_binary
          UI.success('Finished the upload to Apprepo.')
        else
          UI.success('Binary upload skipped or no binary available.')
        end
        
        notify unless options[:notify].nil?
      end

      # Make sure the version on Apprepo matches the one in the ipa
      # If not, the new version will automatically be created
      def verify_version
        app_version = options[:app_version]
        msg = "TODO: Test if Apprepo matches '#{app_version}' from the IPA..."
        UI.message(msg)

        # changed = options[:app].ensure_version!(app_version)
        # if changed
        #  UI.success("Successfully set the version to '#{app_version}'")
        # else
        #  UI.success("'#{app_version}' is the latest version on Apprepo")
        # end
      end

      def download_manifest
        if options[:manifest_path]
          uploader = Apprepo::Uploader.new(options)
          result = uploader.download_manifest_only
          msg = 'Metadata download failed. Check out the error above.'
          UI.user_error!(msg) unless result
        end
      end

      # Upload the binary to Apprepo
      def upload_binary
        if options[:ipa]
          uploader = Apprepo::Uploader.new(options)
          result = uploader.upload
          msg = 'Binary upload failed. Check out the error above.'
          UI.user_error!(msg) unless result
        end
      end

      def notify
        # should be in metadata
        UI.command_output('TODO: Missing implementation for Apprepo Push Notifier')
      end
    end
  end
end
