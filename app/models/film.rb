class Film < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    has_many :comments
    has_many :users, through: :comments

    validates :title, :director, :discription, presence: true
    validates :year, numericality: {only_interger: true}
end


