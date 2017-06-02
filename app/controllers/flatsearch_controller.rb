class FlatsearchController < ApplicationController
  def index
    city = params[:search][:city]
    country = params[:search][:country]

    @flats = Flat.where.not(latitude: nil, longitude: nil)
                 .where("country = ? AND city = ?", country, city)

    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:start_date, :end_date, :city, :country)
  end
end
