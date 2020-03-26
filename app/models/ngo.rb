# frozen_string_literal: true

class Ngo < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  # Validations
  validates :login, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4,
                                                                                     maximum: 15 }
  validates :name, :whatsapp, :city, :uf, presence: true
end
