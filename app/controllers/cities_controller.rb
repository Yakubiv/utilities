class CitiesController < ApplicationController
  def autocomplete_city_name
    cities = City.includes(:region)
                 .where('name LIKE ?', "%#{params[:term]}%")
                 .order(:name).limit(10)
    render json: cities.map { |city| { id: city.id, label: city.autocomplete_name, value: city.name } }
  end
end
