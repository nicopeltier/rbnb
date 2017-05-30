class FlatsearchController < ApplicationController

def index
  @flats = Flat.all
end

  # def flat
  #    @restaurant = Restaurant.find(params[:id])
  # end
private
  def flat_params
    params.require(:flat).permit(:start_date, :end_date, :city, :country)
  end



end
