class ServiceRecord < ApplicationRecord
  validates :total, presence: true
  belongs_to :service
end
