require_relative 'uploader'

module Fastlane
  module AppRepo
    # Responsible for running
    class Runner
      attr_accessor :options

      def initialize(options)
        self.options = options
        AppRepo::DetectValues.new.run!(self.options)
        FastlaneCore::PrintTable.print_values(config: options, hide_keys: [:repo_password], mask_keys: [:repo_key], title: "apprepo-sftp #{AppRepo::VERSION} Summary")
      end

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/CyclomaticComplexity
      def run
        UI.success('AppRepo SFTP Uploader running...')
        verify_version unless options[:app_version].to_s.empty?
        has_binary = options[:ipa]
        if !options[:skip_binary_upload] && !options[:build_number] && has_binary
          upload_binary
        end
        UI.success('Finished the upload to AppRepo.')
        notify unless options[:notify].nil?
      end

      # Make sure the version on AppRepo matches the one in the ipa
      # If not, the new version will automatically be created
      def verify_version
        app_version = options[:app_version]
        msg = "TODO: Test if AppRepo matches '#{app_version}' from the IPA..."
        UI.message(msg)

        # changed = options[:app].ensure_version!(app_version)
        # if changed
        #  UI.success("Successfully set the version to '#{app_version}'")
        # else
        #  UI.success("'#{app_version}' is the latest version on AppRepo")
        # end
      end

      def download_manifest
        if options[:manifest_path]
          uploader = AppRepo::Uploader.new(options)
          result = uploader.download_manifest_only
          msg = 'Metadata download failed. Check out the error above.'
          UI.user_error!(msg) unless result
        end
      end

      # Upload the binary to AppRepo
      def upload_binary
        if options[:ipa]
          uploader = AppRepo::Uploader.new(options)
          result = uploader.upload
          msg = 'Binary upload failed. Check out the error above.'
          UI.user_error!(msg) unless result
        end
      end

      def notify
        # should be in metadata
        UI.command_output('TODO: Missing implementation for AppRepo Push Notifier')
      end
    end
  end
end
