class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.newbooking.subject
  #
  def newbooking(booking)

    @greeting = "Hello"
    @booking = booking
    @user = User.find(@booking.user_id)
    @flat = Flat.find(@booking.flat_id)


    mail(to: @user.email, subject: 'You have a new booking')
    # This will render a view in `app/views/user_mailer`!
  end

end
