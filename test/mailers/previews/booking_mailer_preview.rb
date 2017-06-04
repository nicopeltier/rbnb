
class UserMailerPreview < ActionMailer::Preview
  def newbooking
    booking = Booking.first
    BookingMailer.newbooking(booking)
  end
end

Ò
