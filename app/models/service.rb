class Service < ApplicationRecord
  enum status: { active: 1, inactive: 2 }
  validates :service_type_id, uniqueness: { scope: [:house_id, :status] }
  belongs_to :service_type

  def to_s
    service_type.name
  end
end
