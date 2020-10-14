class AppointmentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      redirect_to doctor_path(@appointment.doctor), alert: "You are already registered or the appointment with this doctor is full"
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointment_path
  end

  private
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:user_id, :doctor_id, :status, :recommendation)
  end
end