class Category < ApplicationRecord
  validates :name, presence: true
  validates_length_of :name, maximum: 25
  validates :name, uniqueness: { scope: :doctors }

  has_many :doctors

end
