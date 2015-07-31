module BossMailer
  class ConfigDeliverer
    def self.config
      {
        mail_settings: {
          from: '',
          to: '',
          subject: '',
          options: {
            address: "smtp.gmail.com",
            port: 587,
            user_name: "<username>",
            password: "<password>",
            authentication: "plain",
            enable_starttls_auto: true
          }
        }
      }
    end
  end
end
