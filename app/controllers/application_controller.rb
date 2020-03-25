# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  # Current Client and Current Company helpers
  helper_method :current_client
  helper_method :current_company

  # Sets layout for devise or application
  before_action :configure_permitted_parameters, if: :devise_controller?

  # REACT CONFIGURATION
  def fallback_index_html
    render file: 'public/index.html'
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end
  # END

  protected

  def current_customer
    @current_customer ||= Customer.where(user: current_user).last
  end

  def current_company
    @current_plan ||= Company.where(user: current_user).last
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:terms_of_service, :user_type,
                                             client_attributes: %i[first_name last_name cpf],
                                             company_attributes: %i[name cnpj phone]])
  end
end
