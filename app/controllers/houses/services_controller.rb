class Houses::ServicesController < Houses::BaseController
  before_action :load_house

  def new
    @service = @house.services.new
  end

  def create
    @service = @house.services.create(service_params)
    redirect_to @house
  end

  private

  def service_params
    params.require(:service)
          .permit!
  end
end
