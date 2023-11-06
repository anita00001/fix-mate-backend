class Api::V1::ExpertsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @experts = Expert.joins(:specialization).where(removed: false).select(
      'experts.id, experts.first_name, experts.last_name, experts.email,experts.address,experts.experience,
      experts.status, experts.fee,
      specializations.name, specializations.description'
    )
    render json: @experts
  end

  def new
    @expert = Expert.new
  end

  def create
    @expert = Expert.new(expert_params)

    if @expert.save
      render json: {
        status: { success: true, message: 'Expert created successfully' }
      }
    else
      render json: @expert.errors, status: :unprocessable_entity
    end
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

  def experts_data
    @data = Expert.all
    if @data
      render json: @data
    else
      render json: { status: 'error', message: 'Error occurred when fetching data' }, status: :unprocessable_entity  
    end
  end

  private

  def expert_params
    params.require(:expert).permit(:first_name, :last_name, :email, :address, :experience, :status, :removed,
                                   :fee, :specialization_id)
  end
end
