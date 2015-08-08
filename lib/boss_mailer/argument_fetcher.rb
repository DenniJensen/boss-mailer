module BossMailer
  class ArgumentFetcher
    def options
      options = {}
      OptionParser.new do |opts|
        opts.on('--init', 'inialize empty setting in home dir') do
          options[:init] = true
        end
        opts.on('--force', 'forces to create a new config file') do
          options[:force] = true
        end
      end.parse!
      options
    end
  end
end
