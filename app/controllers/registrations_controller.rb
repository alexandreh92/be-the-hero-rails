# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def index; end

  def new
    new_user = build_resource
    yield resource if block_given?
    build_associations(new_user)
    respond_with resource
  end

  def create
    verify_params
    build_resource(sign_up_params)
    resource.approved = true if params[:user][:client_attributes].present?
    resource.save
    yield resource if block_given?
    if resource.persisted?
      email_by_resource
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      build_associations(resource)
      flash[:errors] = resource.errors.full_messages
      render action: 'new'
    end
  end

  private

  def email_by_resource
    if params[:user][:company_attributes].present?
      NewCompanyMailer.new_company(resource).deliver_later
    end
    NewUserMailer.new_user(resource).deliver_later if params[:user][:company_attributes].present?
  end

  def verify_params
    if params[:user][:client_attributes].present? && params[:user][:company_attributes].present?
      redirect_to sign_up_path, flash: { error: 'Parâmetros inválidos.' }
    end
  end

  def build_associations(user)
    user.build_client
    user.build_company
  end
end
