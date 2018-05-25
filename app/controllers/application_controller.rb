class ApplicationController < ActionController::API
  include Knock::Authenticable

  before_action :authenticate_user

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

  def render_record_invalid(exception)
    render(json: { errors: exception.record.errors },
           status: :bad_request)
  end

  def render_not_found
    render(json: { errors: [I18n.t(:detail, scope: 'errors.not_found')] },
           status: :not_found)
  end

  def render_general_error(status:, message:)
    render(json: { errors: [message] },
           status: status)

  def not_authorized
    render json: { error: ['unauthorized'] }, status: 401
  end
end
