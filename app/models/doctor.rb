class Doctor < ApplicationRecord
  belongs_to :category
  validates_uniqueness_of :name, :scope => :category_id

  has_many :appointments
  has_many :users, through: :appointments
end
