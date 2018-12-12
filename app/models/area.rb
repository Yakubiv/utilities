class Area < ApplicationRecord
  validates :name, uniqueness: true
end
