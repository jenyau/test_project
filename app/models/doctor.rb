class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable


  belongs_to :category, optional: true
  validates_uniqueness_of :name, :scope => :category_id

  has_many :appointments
  has_many :users, through: :appointments
end
