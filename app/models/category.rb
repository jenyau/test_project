class Category < ApplicationRecord
  validates :name, uniqueness: { scope: :doctors }

  has_many :doctors

end
