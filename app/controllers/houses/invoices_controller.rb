class Houses::InvoicesController < Houses::BaseController
  before_action :load_house

  def show
    @invoice = @house.invoices.find(params[:id])
  end

  def new
    @invoice = @house.invoices.new
    @house.services.each do |service|
      total_praice = service.use_price_as_default_fee ? service.price : 0
      @invoice.service_records.includes(:service).build(service_id: service.id,
                                                        cached_price: service.price,
                                                        total: total_praice)
    end
  end

  def create
    @invoice = @house.invoices.create(invoices_params)
    redirect_to @house
  end

  private

  def invoices_params
    params.require(:invoice)
          .permit(service_records_attributes: [:id, :house_id, :service_id, :cached_price, :total, :value])
          .merge(month: Date.current.month, year: Date.current.year, status: Invoice.statuses[:pending])
  end
end
