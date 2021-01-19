class User < ApplicationRecord
    has_many :recommendations
    has_many :channels, through: :recommendations
end
