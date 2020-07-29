class User < ApplicationRecord
    has_secure_password
    has_many :films
    has_many :received_comments, through: :films, source: :comments
    has_many :comments
    has_many :commented_films, through: :comments, source: :film

    validates :username, :email, presence: true
    validates :email, uniqueness: true
    

    def self.from_omniauth(response)
        # Creates a new user only if it doesn't exist
       User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
        u.username = response[:info][:name]
        u.email = response[:info][:email]
        u.password = SecureRandom.hex(15)
        end
    end
end