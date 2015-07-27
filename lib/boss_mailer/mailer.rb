module BossMailer
  class Mailer
    def initialize(mail_settings, working_hours)
      @mail_settings = mail_settings
      @working_hours = working_hours
      body_content = mail_body
      @mailer = Mail.new do
        to mail_settings[:to]
        from mail_settings[:from]
        subject mail_settings[:subject]
        body body_content
      end
    end

    def mail
      @mailer.delivery_method :smtp, address: "localhost", port: 1025
      @mailer.deliver
    end

    def mail_body
      "Start #{@working_hours[:start]} \n\
      Ende #{@working_hours[:end]}\n\
      Pause #{@working_hours[:pause]}"
    end
  end
end
