class ApplicationController < ActionController::API
  include AbstractController::Translation

  rescue_from ActiveRecord::ActiveRecordError, with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid
  rescue_from ArgumentError, with: :bad_request

  private

  def internal_server_error
    render status: :internal_server_error, json: { error: t('.internal_server_error') }
  end

  def not_found
    render status: :not_found
  end

  # def bad_request(err)
  #   err_message = err.message.gsub(/('.*')/, '').split
  #   messages = {}
  #   messages[err_message.pop] = t(".#{err_message.join('_')}")
  #   render status: :bad_request, json: { error: t('.bad_request'), messages: }
  # end

  def invalid(err)
    render status: :unprocessable_entity, json: { errors: err.record.errors }
  end
end
