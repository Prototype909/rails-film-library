class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :film

    validates :body, presense: true
end