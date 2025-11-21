class ReviewsController < ApplicationController
  def create
    raise
  end

  private

  def params_review
    params.require(:review).permit(:rating, :comment, :list_id)
  end
end
