namespace :database do
  task import_cities: :environment do
    require 'csv'

    regions = []
    areas = []
    cities = []
    CSV.foreach('lib/assets/ukraine/regions.csv', headers: true) do |row|
      regions << Region.new(id: row['id'], name: row['region'])
    end

    Region.import(regions)

    CSV.foreach('lib/assets/ukraine/areas.csv', headers: true) do |row|
      areas << Area.new(id: row['id'], region_id: row['region_id'], name: row['area'])
    end

    Area.import(areas)

    CSV.foreach('lib/assets/ukraine/cities.csv', headers: true) do |row|
      cities << City.new(id: row['id'], area_id: row['area_id'], region_id: row['region_id'], name: row['village'])
    end

    City.import(cities)
  end
end