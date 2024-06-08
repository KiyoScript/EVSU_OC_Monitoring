class NotifyParent < ApplicationMailer
  def time_in_or_out_notice(attendance, action)
    @attendance = attendance
    @user = attendance.attendable
    @action = action
    mail(to: email_to_deliver(@user.guardian_email), subject: "EVSU-OC Monitoring - #{@user.fullname} has #{@action}")
  end
end
