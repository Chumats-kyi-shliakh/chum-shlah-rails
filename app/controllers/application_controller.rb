class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid do |e|
    invalid(e)
  end

  def health
    render json: { message: "All's good" }, status: :ok
  end

  private

  def not_found
    render json: { message: "Not found" }, status: :not_found
  end

  def invalid(e)
    render json: { message: e.message }, status: :unprocessable_entity
  end
end
