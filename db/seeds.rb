# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
user.create(
  :name => 'Maria',
  :hashed_password => '76820272dc4ccb6b8a2886ed007b3a503b9b42264953be32f06f891bc5d94cfc',
  :salt => '326797680.8958211999747828',
  :administrator => 't',
  :score => 0
)
