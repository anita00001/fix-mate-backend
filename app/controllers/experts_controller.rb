class ExpertsController < ApplicationController
  def index
    @experts = Expert.includes(:specialization).where(removed: true)

    render json: @experts
  end

  def new
    @expert = Expert.new
  end

  def show
    @expert = Expert.find(params[:id])
    @specialization = @expert.specialization

    render json: @specialization
  end

  def toggle_remove
    @expert = Expert.find(params[:id])
    if @expert.change_removed_status
      render json: { status: 'success', message: 'Toggle successful' }
    else
      render json: { status: 'error', message: 'Toggle failed' }, status: :unprocessable_entity
    end
  end

  private

  def expert_params
    params.require(:expert).permit(:first_name, :last_name, :email, :address, :experience, :status, :removed, :image,
                                   :fee)
  end
end
