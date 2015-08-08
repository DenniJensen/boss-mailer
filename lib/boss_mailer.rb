require 'boss_mailer/version'
require 'boss_mailer/config_deliverer'
require 'boss_mailer/config_fetcher'
require 'boss_mailer/argument_fetcher'
require 'boss_mailer/time_parser'
require 'boss_mailer/mailer'
require 'optparse'
require 'mail'
require 'yaml'

module BossMailer
  CONFIG_PATH = BossMailer::ConfigFetcher::CONFIG_PATH

  def self.run
    puts "The version #{BossMailer::VERSION}"
    config_fetcher = BossMailer::ConfigFetcher.new
    options = BossMailer::ArgumentFetcher.new.options

    if options[:init]
      if config_fetcher.existing_config? && !options[:force]
        puts "file alread exists in #{CONFIG_PATH}"
        puts 'Use --init --force to reinstall config file'
        exit 1
      else
        config = BossMailer::ConfigDeliverer.config
        File.open(CONFIG_PATH, 'w') { |file| YAML.dump(config, file) }
        puts "Config File created in #{CONFIG_PATH}"
        puts 'Please fill in all the information in this config file'
        exit 0
      end
    end

    unless config_fetcher.existing_config?
      puts 'No Config file found, please use --init to initialize one'
      puts 'After creating a config file, please fill in the mail informations'
      exit 1
    end

    unless config_fetcher.config_complete?
      puts "Configuration is missing in: #{CONFIG_PATH}"
      exit 1
    end

    if ARGV.size < 3
      puts 'Need start, end and pause of work'
      exit 1
    end

    time_parser = BossMailer::TimeParser.new
    working_time = {
      start: time_parser.parse(ARGV.shift),
      end: time_parser.parse(ARGV.shift),
      pause: time_parser.parse(ARGV.shift)
    }

    input = false
    while input == false
      p working_time
      puts 'Is this time correct'
      input = gets.chomp
      input = true if input == 'y' || input == 'Y'
      exit 0 if input == 'n' || input == 'N'
    end

    puts 'mailing ...'
    mailer = BossMailer::Mailer.new(config_fetcher.mail_settings, working_time)
    mailer.mail
  end
end
