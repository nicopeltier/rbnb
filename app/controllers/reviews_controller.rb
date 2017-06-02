class ReviewsController < ApplicationController
  before_action :set_flat

  def new
    @review = Review.new
  end

  def create

    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.flat_id = @flat.id

    if @review.save
        respond_to do |format|
          format.html { redirect_to flat_path(@flat) }
          format.js  # <-- will render `app/views/reviews/create.js.erb`
        end
      else
        respond_to do |format|
          format.html { redirect_to flat_path(@flat)}
          format.js  # <-- idem
        end
      end
  end

private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
