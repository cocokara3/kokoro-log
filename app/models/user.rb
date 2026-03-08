class User < ApplicationRecord
  has_secure_password
  has_many :daily_responses, dependent: :destroy
end
