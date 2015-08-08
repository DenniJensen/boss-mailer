require 'yaml'

module BossMailer
  class ConfigFetcher
    attr_reader :mail_settings

    CONFIG_PATH = ENV['HOME'] + '/.boss-mailer.yml'

    def initialize
      @mail_settings = fetch_mail_settings
    end

    def existing_config?
      File.exist? CONFIG_PATH
    end

    def config_complete?
      mail_setting_complete?
    end

    private

    def mail_setting_complete?
      blank = @mail_settings[:to].blank? || @mail_settings[:from].blank? ||
              @mail_settings[:subject].blank?
      !blank
    end

    def fetch_mail_settings
      settings[:mail_settings]
    end

    def settings
      YAML.load_file(CONFIG_PATH)
    end
  end
end
