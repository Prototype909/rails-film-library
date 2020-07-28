class Film < ApplicationRecord
has_many :films

validates :name, presence: true

end