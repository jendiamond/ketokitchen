class Comment < ApplicationRecord
  belongs_to :chef
  belongs_to :recipe
  validates :description, presence: true, length: {minimum: 2, maximum: 1500}
  validates :chef_id, presence: true
  validates :recipe_id, presence: true
  default_scope -> {order(updated_at: :desc)}
end
