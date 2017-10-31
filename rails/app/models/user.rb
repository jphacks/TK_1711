class User < ApplicationRecord
    has_many :containers

    has_secure_password
end
