class User < ApplicationRecord
    has_secure_password
    has_many :films
    has_many :received_comments, through: :films, source: :comments
    has_many :comments
    has_many :commented_films, through: :comments, source: :film

    validates :username, :email, presence: true
    validates :email, uniqueness: true
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
end