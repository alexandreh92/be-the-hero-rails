# frozen_string_literal: true

class Incident < ApplicationRecord
  # Associations
  belongs_to :ngo

  # Validations
  validates :title, :description, :value, presence: true
end
