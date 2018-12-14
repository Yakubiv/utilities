class House < ApplicationRecord
  validates :address, uniqueness: true

  has_many :services
  has_many :invoices
  belongs_to :city

  def city_name
    city&.name
  end

  def city_name=(name)
    self.city_id = City.find_by(name: name) if name.present?
  end
end
