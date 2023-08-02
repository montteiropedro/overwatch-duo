class ApplicationController < ActionController::API
  rescue_from ActiveRecord::ActiveRecordError, with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid
  rescue_from ArgumentError, with: :bad_request

  private

  def internal_server_error
    render status: :internal_server_error
  end

  def not_found
    render status: :not_found
  end

  def bad_request(err)
    message = err.message.gsub(/('.*')/, '').split
    errors = {}
    errors[message.pop] = message.join(' ')
    render status: :bad_request, json: { message: 'Erro nos parâmetros enviados', errors: }
  end

  def invalid(error)
    render status: :unprocessable_entity, json: { errors: error.record.errors }
  end
end
