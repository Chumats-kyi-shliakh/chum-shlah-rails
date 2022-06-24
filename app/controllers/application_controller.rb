class ApplicationController < ActionController::API
  def health
    render json: { message: "All's good" }, status: 200
  end
end
