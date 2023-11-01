class Api::V1::ReservationsController < ApplicationController
  # before_action :authenticate_user!

  # Show all reservations
  # GET /reservations
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:expert_id, :user_id, :city, :date)
  end
end
