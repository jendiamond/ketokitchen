class Chef < ApplicationRecord
  has_many :recipes
  validates :chefname, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, uniqueness: {case_sensitive: false},
                    format: { with: VALID_EMAIL_REGEX}
end
