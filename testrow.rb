require 'csv'
require 'awesome_print'

CSV.foreach(Rails.root.join('movie_list.csv')) do |row|
  ap row.title
  ap row.image
  ap row.desc
end
