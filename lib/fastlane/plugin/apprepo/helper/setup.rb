module Fastlane
  module Apprepo
    # Responsible for setting up the Repofile configuration
    class Setup
      def setup_apprepo(file_path, data, _apprepo_path, _options)
        UI.message('[Apprepo:Setup] Setting up...')
        File.write(file_path, data)

        # TODO: implement later
        download_manifest(apprepo_path, options)

        UI.success("NOT! created new Repofile at path '#{file_path}'")
      end

      # This method takes care of creating a new 'apprepo' folder with metadata
      # and screenshots folders
      def generate_apprepo_file(_apprepo_path, options)
        # v = options[:app].latest_version
        # generate_apprepo_file(v, File.join(apprepo_path, 'manifest.json'))

        # Generate the final Repofile here
        gem_path = Helper.gem_path('apprepo')
        apprepo = File.read("#{gem_path}/../assets/RepofileDefault")
        apprepo.gsub!('[[APP_IDENTIFIER]]', options[:app].bundle_id)
        apprepo.gsub!('[[APPREPO_IPA_PATH]]', options[:app].file_path)
        apprepo.gsub!('[[APP_VERSION]]', options[:app].version)
        apprepo.gsub!('[[APP_NAME]]', options[:app].name)
        # apprepo (was deliver)
      end

      def download_manifest(apprepo_path, _options)
        path = File.join(apprepo_path, 'metadata')
        FileUtils.mkdir_p(path)
        UI.success("TODO: DOWNLOAD MANIFEST'")
        Apprepo::Uploader.new(options).download_manifest_only
      end

      def run(options)
        UI.message('[Apprepo:Setup] Running...')
        containing = (File.directory?('fastlane') ? 'fastlane' : '.')
        file_path = File.join(containing, 'Repofile')
        data = generate_apprepo_file(containing, options)
        setup_apprepo(file_path, data, containing, options)
      end
    end
  end

  # @setup = new Apprepo::Setup
end
