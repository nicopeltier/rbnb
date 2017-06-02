class FlatsController < ApplicationController
  def index
    @flats = Flat.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def user_index
    if user_signed_in?
      @flats = current_user.flats
    else
      redirect_to user_session_path
    end

  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new

    @reviews = Review.where(params[:flat_id]).order(rating: :desc)

    @hash = Gmaps4rails.build_markers(@flat) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
    @reviews = Review.where("flat_id = ?", @flat.id).order(rating: :desc)
    @review = Review.new



  end

  def new
    if user_signed_in?
      @flat = Flat.new
    else
      redirect_to user_session_path
    end
  end

  def create
    if user_signed_in?
      @flat = Flat.new(flat_params)
      @flat.user = current_user
      @flat.save!
      redirect_to my_properties_path
    else
      redirect_to user_session_path
    end
  end

  def edit
    @flat = Flat.find(params[:id])
    if @flat.user == current_user
      render :edit
    else
      flash[:alert] = "Access Denied"
      redirect_to flats_path
    end
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    @flat.save
    redirect_to flat_path(@flat)
  end


  private

  def flat_params
    params.require(:flat).permit(:short_description, :description, :room_count,
      :property_type, :price, :country, :city, :street, :zipcode, :picture, :picture_cache)
  end

end
