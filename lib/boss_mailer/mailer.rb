module BossMailer
  class Mailer
    def initialize(mail_settings, working_hours)
      @working_hours = working_hours
      @mail_settings = mail_settings
      @options = @mail_settings.delete :options
      @mail_settings[:body] = mail_body
      @mailer = Mail.new @mail_settings
    end

    def mail
      @mailer.delivery_method :smtp, @options
      @mailer.deliver
    end

    private

    def mail_body
      "#{Time.now.strftime('%a: %d/%m/%Y')}\n\
      \nStart #{@working_hours[:start]}\
      \nEnde #{@working_hours[:end]}\
      \nPause #{@working_hours[:pause]}"
    end
  end
end
