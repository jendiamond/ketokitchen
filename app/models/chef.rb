class Chef < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :chefname, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, uniqueness: {case_sensitive: false},
                    format: { with: VALID_EMAIL_REGEX}
  has_secure_password
  validates :password, presence: true, length: { minimum: 8}, allow_nil: true
  default_scope -> { order(updated_at: :desc)}
end
