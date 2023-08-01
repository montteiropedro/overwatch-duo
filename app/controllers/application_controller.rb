class ApplicationController < ActionController::API
  rescue_from ActiveRecord::ActiveRecordError, with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def internal_server_error
    render status: 500
  end

  def not_found
    render status: 404
  end
end
