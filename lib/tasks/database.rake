namespace :database do
  task import_cities: :environment do
    require 'csv'

    regions = []
    areas = []
    cities = []
    CSV.foreach('lib/assets/ukraine/regions.csv', headers: true) do |r|
      row = r.to_h
      regions << Region.new(id: row['id'].to_i, name: row['region'])
    end
    Region.import(regions)

    CSV.foreach('lib/assets/ukraine/areas.csv', headers: true) do |r|
      row = r.to_h
      areas << Area.new(id: row['id'], region_id: row['region id'].to_i, name: row['area'])
    end
    Area.import(areas)

    CSV.foreach('lib/assets/ukraine/cities.csv', headers: true) do |r|
      row = r.to_h
      cities << City.new(id: row['id'], area_id: row['area id'].to_i,
                                        region_id: row['region id'].to_i,
                                        name: row['village'])
    end
    City.import(cities)
  end
end