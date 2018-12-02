class Invoice < ApplicationRecord
  enum status: { pending: 1, paid: 2 }

  before_save :set_total_invoice_price

  has_many :service_records

  accepts_nested_attributes_for :service_records

  private

  def set_total_invoice_price
    self.total = service_records.map(&:total).sum
  end
end
