# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'dummytests.rails@gmail.com'
  layout 'mailer'
end
