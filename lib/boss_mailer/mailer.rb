module BossMailer
  class Mailer
    def initialize(mail_settings, working_hours)
      @mail_settings = mail_settings
      @working_hours = working_hours
      binding.pry
      @mailer = Mail.new do
        to mail_settings[:to]
        from mail_settings[:from]
        subject mail_settings[:subject]
      end
    end

    def mail
      @mailer.delivery_method :smtp, address: "localhost", port: 1025
      @mailer.deliver
    end
  end
end
