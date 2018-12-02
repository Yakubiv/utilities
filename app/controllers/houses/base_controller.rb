class Houses::BaseController < ApplicationController
  def load_house
    @house = House.includes(services: :service_type).find(params[:house_id])
  end
end
