class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable

  validates :name, presence: true
  validates :image, presence: true
  validates :phone_number, presence: true
  validates_length_of :name, maximum: 30
  validates_length_of :phone_number, maximum: 13



  mount_uploader :image, ImageUploader

  belongs_to :category, optional: true
  validates_uniqueness_of :name, :scope => :category_id

  has_many :appointments
  has_many :users, through: :appointments

end
