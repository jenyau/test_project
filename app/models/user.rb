class User < ApplicationRecord
 # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:phone_number]
  has_many :appointments
  has_many :doctors, through: :appointments

  validates :name, presence: true
  validates :image, presence: true
  validates :phone_number, presence: true
  validates_length_of :name, maximum: 30
  validates_length_of :phone_number, maximum: 13

  mount_uploader :image, ImageUploader
end