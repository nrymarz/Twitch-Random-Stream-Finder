class User < ApplicationRecord
    has_secure_password
    has_many :recommendations
    has_many :filters
    has_many :channels, through: :recommendations

    validates :name, presence: true
end
