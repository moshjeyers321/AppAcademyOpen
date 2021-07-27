# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all

c1 = Cat.create!(
  birth_date: '2015/01/20', 
  color: 'white',
  name: 'Mittens', 
  sex: 'M',
  description: 'What an absolute cutey. Has an extra thumb'
)
c2 = Cat.create!(
  birth_date: '2018/06/05', 
  color: 'brown',
  name: 'Dexter', 
  sex: 'M',
  description: 'Devilishly smart!'
)
c3 = Cat.create!(
  birth_date: '2012/05/01', 
  color: 'black',
  name: 'Joan', 
  sex: 'F',
  description: 'An old soul for sure.'
)

