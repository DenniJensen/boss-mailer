require 'yaml'

module BossMailer
  class ConfigFetcher
    attr_accessor :mail_settings
    attr_accessor :working_hours

    def initialize
      @mail_settings = fetch_mail_settings
      @working_hours = fetch_working_hours
    end

    private

    def fetch_mail_settings
      settings[:mail_settings]
    end

    def fetch_working_hours
      settings[:working_hours]
    end

    def settings
      YAML.load_file(config_path)
    end

    def config_path
      'not yet implemented'
    end
  end
end
