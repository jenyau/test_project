class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validate :limit_appointment

  #validates :user_id, :uniqueness => {:scope =>  :doctor_id, if: status: false }
  validates_uniqueness_of :user_id, :scope => :doctor_id, if: Proc.new { |appointment| appointment.status }

  private

  # def uniq_doctor
  #   unless self.user.appointments..where(status: true).where(user_id: self.user_id).empty?
  #     errors.add(:user_id, "You are already registered with this doctor")
  #   end
  # end

  def limit_appointment
    if doctor.appointments.where(status: true).size > 10
      errors.add(:doctor_id, "has more than 10 open appointments")
    end
  end
end