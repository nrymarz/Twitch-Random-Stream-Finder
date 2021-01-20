class User < ApplicationRecord
    has_secure_password
    has_many :recommendations
    has_many :channels, through: :recommendations
end
