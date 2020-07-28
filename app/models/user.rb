class User < ApplicationRecord
    has_secure_password
    has_many :films
    has_many :recived_comments, through: :film, source: comments
    has_many :comments
    has_many :recived_comments, through: comments, source: films

    validates :username, email, presence: true
    validates :email, uniqueness: true
    validates :password, confirmation: true
    validates :password_confirmation, presense: true
end