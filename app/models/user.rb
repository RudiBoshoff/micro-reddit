class User < ApplicationRecord
    has_many :posts
    has_many :comments
    validates :name, presence: true, length: {in: 3..21}, uniqueness: true
    REGEX_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: {with: REGEX_EMAIL_FORMAT,
               message: "Please enter a valid email address: eg. example@work.com"},
               length: { maximum: 255 }
end
