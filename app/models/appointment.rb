class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validate :limit_appointment

  private

  def limit_appointment
    if doctor.appointments.where(status: true).size > 10
      errors.add(:doctor_id, "has more than 10 open appointments")

    end
  end
end