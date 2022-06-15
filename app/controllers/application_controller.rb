class ApplicationController < ActionController::API
  def render_unprocessable_entity(resource)
    errors = {}

    resource.errors.attribute_names.each do |error|
      errors[error] = resource.errors.full_messages_for(error)
    end

    render_errors(errors, :unprocessable_entity)
  end

  def render_errors(errors, status)
    render json: { errors: errors }, status: status
  end
end
