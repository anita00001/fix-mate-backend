class ExpertController < ApplicationController
  def index
    @experts = Expert.all
    @specialzation = @expert.specialzation
  end

  def new
    @expert = Expert.new
  end

  def show
    @expert = Expert.find(params[:id])
    @specialzation = @expert.specialzation
  end
end
