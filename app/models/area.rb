class Area < ApplicationRecord
  validates :name, uniqueness: true
  belongs_to :region
  has_many :cities
end
