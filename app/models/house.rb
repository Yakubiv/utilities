class House < ApplicationRecord
  validates :address, uniqueness: true

  has_many :services
  has_many :invoices
end
