class RfidNotification < ApplicationMailer
  def rfid_updated(user)
    @user = user
    mail(to: email_to_deliver('nathanielkate.simon@evsu.edu.ph'), subject: "EVSU-OC Monitoring - Your'e RFID has been UPDATED!!!")
  end
end