class Film < ApplicationRecord
    belongs_to :user
    has_many :comments

    validates :title, presense: true
    validates :director, presense: true
    validates :year, numericality: {only_interger: true}
    validates :discription, presense: true
end


