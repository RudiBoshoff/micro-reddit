class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, presence: true, length: {in: 3..70},
               uniqueness: true
    validates :link, presence: true, length: {in: 3..100}
end
