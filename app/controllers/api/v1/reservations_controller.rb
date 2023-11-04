class Api::V1::ReservationsController < ApplicationController
  # Show all reservations
  # GET /reservations
  def index
    @reservations = Reservation.includes(expert: :specialization, user: {}).all
    render json: @reservations.to_json(include: { expert: { only: %i[first_name last_name email fee],
                                                            include: {
                                                              specialization: { only: %i[id name] }
                                                            } },
                                                  user: { only: %i[id name] } })
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
