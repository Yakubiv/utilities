class City < ApplicationRecord
  validates :name, uniqueness: true
  belongs_to :area
  belongs_to :region

  def autocomplete_name
    "#{name} (#{region.name} район)"
  end
end
