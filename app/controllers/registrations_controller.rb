# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        render json: { user: resource,
                       token: current_token }
      end
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end
end
