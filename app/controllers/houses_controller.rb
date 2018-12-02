class HousesController < ApplicationController
  before_action :load_house, only: %i[show destroy edit]
  def show
  end

  def new
    @house = House.new
  end

  def create
    @house = House.create(house_params)
    redirect_to dashboard_path
  end

  def destroy
  end

  private

  def house_params
    params.require(:house)
          .permit(:address)
  end

  def load_house
    @house = House.includes(services: :service_type).find(params[:id])
  end
end
