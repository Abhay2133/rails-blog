class User < ApplicationRecord
  validates :name,  presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, length: { minimum: 5, maximum: 255 },
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
