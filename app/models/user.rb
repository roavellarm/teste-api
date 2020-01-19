# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, presence: true

  include DeviseTokenAuth::Concerns::User

  def as_json(_options = {})
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      email: email
    }
  end
end
