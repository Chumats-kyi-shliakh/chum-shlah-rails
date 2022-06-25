class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def health
    render json: { message: "All's good" }, status: 200
  end

  private

  def not_found
    render json: { message: "Not found" }, status: 404
  end
end
