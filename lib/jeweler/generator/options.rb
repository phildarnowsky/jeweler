class Jeweler
  class Generator
    class Options < Hash
      attr_reader :opts

      def initialize(args)
        super()

        self[:testing_framework] = :shoulda

        @opts = OptionParser.new do |o|
          o.banner = "Usage: #{File.basename($0)} [options] reponame\ne.g. #{File.basename($0)} the-perfect-gem"

          o.on('--bacon', 'generate bacon specs') do
            self[:testing_framework] = :bacon
          end

          o.on('--shoulda', 'generate shoulda tests') do
            self[:testing_framework] = :shoulda
          end

          o.on('--testunit', 'generate test/unit tests') do
            self[:testing_framework] = :testunit
          end

          o.on('--minitest', 'generate minitest tests') do
            self[:testing_framework] = :minitest
          end

          o.on('--rspec', 'generate rspec tests') do
            self[:testing_framework] = :rspec
          end

          o.on('--cucumber', 'generate cucumber stories in addition to the other tests') do
            self[:use_cucumber] = true
          end

          o.on('--create-repo', 'create the repository on GitHub') do
            self[:create_repo] = true
          end

          o.on('--summary [SUMMARY]', 'specify the summary of the project') do |summary|
            self[:summary] = summary
          end

          o.on('--directory [DIRECTORY]', 'specify the directory to generate into') do |directory|
            self[:directory] = directory
          end

          o.on_tail('-h', '--help', 'display this help and exit') do
            self[:show_help] = true
          end
        end

        @opts.parse!(args)
      end

    end
  end
end
