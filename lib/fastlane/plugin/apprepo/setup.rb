module Fastlane
  module Apprepo
    # Responsible for setting up the Repofile configuration
    class Setup
      def setup_Apprepo(file_path, data, _Apprepo_path, _options)
        UI.message('[Apprepo:Setup] Setting up...')
        File.write(file_path, data)

        # TODO: implement later
        download_manifest(Apprepo_path, options)

        UI.success("NOT! created new Repofile at path '#{file_path}'")
      end

      # This method takes care of creating a new 'Apprepo' folder with metadata
      # and screenshots folders
      def generate_Apprepo_file(_Apprepo_path, options)
        # v = options[:app].latest_version
        # generate_Apprepo_file(v, File.join(Apprepo_path, 'manifest.json'))

        # Generate the final Repofile here
        gem_path = Helper.gem_path('Apprepo')
        Apprepo = File.read("#{gem_path}/../assets/RepofileDefault")
        Apprepo.gsub!('[[APP_IDENTIFIER]]', options[:app].bundle_id)
        Apprepo.gsub!('[[Apprepo_IPA_PATH]]', options[:app].file_path)
        Apprepo.gsub!('[[APP_VERSION]]', options[:app].version)
        Apprepo.gsub!('[[APP_NAME]]', options[:app].name)
        # Apprepo (was deliver)
      end

      def download_manifest(Apprepo_path, _options)
        path = File.join(Apprepo_path, 'metadata')
        FileUtils.mkdir_p(path)
        UI.success("TODO: DOWNLOAD MANIFEST'")
        Apprepo::Uploader.new(options).download_manifest_only
      end

      def run(options)
        UI.message('[Apprepo:Setup] Running...')
        containing = (File.directory?('fastlane') ? 'fastlane' : '.')
        file_path = File.join(containing, 'Repofile')
        data = generate_Apprepo_file(containing, options)
        setup_Apprepo(file_path, data, containing, options)
      end
    end
  end

  # @setup = new Apprepo::Setup
end
