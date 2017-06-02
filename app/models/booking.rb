class Booking < ApplicationRecord

  belongs_to :flat
  belongs_to :user
  after_create :send_new_booking_email

  def send_new_booking_email
    BookingMailer.newbooking(self).deliver_now
  end

end
