class Film < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    has_many :comments
    has_many :users, through: :comments

    validates :title, :director, :description, presence: true
    validates :year, numericality: {only_integer: true}

    def self.alpha
        self.order(:title)
    end
end


