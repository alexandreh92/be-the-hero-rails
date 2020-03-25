# frozen_string_literal: true

require 'test_helper'

class NewUserMailerTest < ActionMailer::TestCase
  test 'new user email' do
    user = users(:one)

    # Set up an email using the order contents
    email = NewUserMailer.new_user(user)

    # Check if the email is sent
    assert_emails 1 do
      email.deliver_later
    end
  end
end
