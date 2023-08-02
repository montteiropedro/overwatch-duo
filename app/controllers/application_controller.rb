class ApplicationController < ActionController::API
  rescue_from ActiveRecord::ActiveRecordError, with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid

  private

  def internal_server_error
    render status: :internal_server_error
  end

  def not_found
    render status: :not_found
  end

  def invalid(error)
    render status: :unprocessable_entity, json: { errors: error.record.errors.full_messages }
  end
end
