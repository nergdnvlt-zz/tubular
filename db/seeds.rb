# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

base = BaseCondition.create!(
  name: 'boulder_creek',
  min_temp: 85,
  min_flow: 40,
  max_flow: 300,
  acceptable_clouds:
  [
    'Windy',
    'Cloudy',
    'Mostly Cloudy',
    'Partly Cloudy',
    'Clear',
    'Sunny',
    'Fair',
    'Hot'
  ]
)
CurrentCondition.create!(name: 'boulder_creek', base_condition: base, current_temp: 85, current_flow: 88, current_clouds: 'Clear')
