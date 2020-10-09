class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validate :limit_appointment



  def limit_appointment
    if doctor.appointments.where(status: true).length > 2
      errors.add(:doctor_id, "has more than 10 open appointments")
    end
  end
end