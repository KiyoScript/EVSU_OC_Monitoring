class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  private
    ## prevent sending mails to REAL email addresses when not in production environment
    def email_to_deliver(email)
      if Rails.env == "production"
        email
      else
        ENV['MAIL_INTERCEPTOR_EMAIL']
      end
    end
end
