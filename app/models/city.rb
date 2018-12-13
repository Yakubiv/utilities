class City < ApplicationRecord
  validates :name, uniqueness: true
  belongs_to :area
  belongs_to :region
end
