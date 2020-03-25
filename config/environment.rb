# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html_tag.html_safe
end
Faker::Config.locale = 'pt-BR'
# Initialize the Rails application.
Rails.application.initialize!
