class CitiesController < ApplicationController
  autocomplete :city, :name, limit: 10 
end
