require 'fastlane_core'

module Fastlane
  module Apprepo
    # Provides available options for the commands generator
    class Options
      # rubocop:disable Metrics/AbcSize
      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :ipa,
                                       short_option: '-i',
                                       optional: true,
                                       env_name: 'APPREPO_IPA_PATH',
                                       description: 'Path to your ipa file',
                                       default_value: Dir['*.ipa'].first,
                                       verify_block: proc do |value|
                                         UI.user_error!("Could not find ipa file at path '#{value}'") unless File.exist?(value)
                                         UI.user_error!("'#{value}' doesn't seem to be an ipa file") unless value.end_with?('.ipa')
                                       end),
          FastlaneCore::ConfigItem.new(key: :app_identifier,
                                       short_option: '-b',
                                       optional: false,
                                       env_name: 'APPREPO_APP_ID',
                                       description: 'Your bundle identifier',
                                       default_value: ''),
          FastlaneCore::ConfigItem.new(key: :app_code,
                                       short_option: '-c',
                                       optional: true,
                                       env_name: 'APPREPO_APPCODE',
                                       description: 'APPCODE value for apprepo'),
          FastlaneCore::ConfigItem.new(key: :repo_url,
                                       short_option: '-r',
                                       optional: false,
                                       env_name: 'APPREPO_URL',
                                       description: 'URL of your Apprepo server'),
          FastlaneCore::ConfigItem.new(key: :repo_user,
                                       short_option: '-u',
                                       optional: false,
                                       env_name: 'APPREPO_USER',
                                       description: 'USER of your Apprepo server'),
          FastlaneCore::ConfigItem.new(key: :repo_password,
                                       short_option: '-p',
                                       optional: true,
                                       env_name: 'APPREPO_PASSWORD',
                                       description: 'PASSWORD for your Apprepo server (not for production)',
                                       conflicting_options: [:repo_key],
                                       conflict_block: proc do |value|
                                         UI.user_error!("You can't use 'password' and '#{value.key}' options in one run.")
                                       end),
          FastlaneCore::ConfigItem.new(key: :repo_key,
                                       short_option: '-k',
                                       optional: false,
                                       env_name: 'APPREPO_KEY',
                                       description: 'RSA key for your Apprepo server',
                                       conflicting_options: [:repo_password],
                                       conflict_block: proc do |value|
                                         UI.user_error!("You can't use 'repo_key' and '#{value.key}' options in one run.")
                                       end),
          FastlaneCore::ConfigItem.new(key: :repo_description,
                                       short_option: '-d',
                                       optional: true,
                                       description: 'Long detailed description for your Apprepo server',
                                       default_value: ''),
          FastlaneCore::ConfigItem.new(key: :repo_summary,
                                       short_option: '-s',
                                       optional: true,
                                       description: 'Short description for your Apprepo server',
                                       default_value: ''),
          FastlaneCore::ConfigItem.new(key: :manifest_path,
                                       short_option: '-m',
                                       description: 'Path to the folder containing the metadata files',
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :repo_title,
                                       short_option: '-a',
                                       description: 'Title of the app',
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :appcode,
                                       short_option: '-o',
                                       description: 'Name of the app on Apprepo',
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :skip_binary_upload,
                                       description: 'Skip uploading an ipa or to Apprepo',
                                       is_string: false,
                                       default_value: false),
          FastlaneCore::ConfigItem.new(key: :app_version,
                                       short_option: '-z',
                                       description: 'The version that should be edited or created',
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :skip_manifest,
                                       description: "Don't upload the metadata (e.g. title, description), this will still upload screenshots",
                                       is_string: false,
                                       default_value: false),
          FastlaneCore::ConfigItem.new(key: :notify,
                                       description: 'Notify Apprepo users on update',
                                       is_string: false,
                                       default_value: false),
          FastlaneCore::ConfigItem.new(key: :build_number,
                                       short_option: '-n',
                                       description: 'If set the given build number (already uploaded to iTC) will be used instead of the current built one',
                                       optional: true,
                                       conflicting_options: [:ipa],
                                       conflict_block: proc do |value|
                                         UI.user_error!("You can't use 'build_number' and '#{value.key}' options in one run.")
                                       end),

          # App Metadata
          # Non Localised
          FastlaneCore::ConfigItem.new(key: :app_icon,
                                       description: 'Metadata: The path to the app icon',
                                       optional: true,
                                       short_option: '-l',
                                       verify_block: proc do |value|
                                         UI.user_error!("Could not find png file at path '#{value}'") unless File.exist?(value)
                                         UI.user_error!("'#{value}' doesn't seem to be a png file") unless value.end_with?('.png')
                                       end)
        ]
      end
    end
  end
end
