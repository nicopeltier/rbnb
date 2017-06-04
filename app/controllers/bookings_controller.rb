class BookingsController < ApplicationController


def index
  if user_signed_in?
    @bookings = current_user.bookings
  else
    redirect_to user_session_path
  end
end




def confirm_status
  @booking = Booking.find(params[:booking_id])
  @booking.update(status: "Confimred")
  if @booking.save
    redirect_to my_properties_path
  else
    flash[:alert] = "Could not confirm"
    render my_properties_path
  end
end

def decline_status
  @booking = Booking.find(params[:booking_id])
  @booking.update(status: "Declined")
  if @booking.save
    redirect_to my_properties_path
  else
    flash[:alert] = "Could not confirm"
    render my_properties_path
  end
end

def create
  if user_signed_in?
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    @booking.status = "Pending"
    if @booking.save
      redirect_to bookings_path
    else
      render "flats/show"
    end
  else
    redirect_to user_session_path
  end
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end


end
