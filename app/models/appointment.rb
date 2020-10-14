class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validate :limit_appointment
  validates_uniqueness_of :user_id, :scope => :doctor_id, if: Proc.new { |appointment| appointment.status }

  private

  def limit_appointment
    if doctor.appointments.where(status: true).size > 10
      errors.add(:doctor_id, "has more than 10 open appointments")
    end
  end
end