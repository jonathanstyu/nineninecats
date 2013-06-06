# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create(name: 'Isabel', birth_date: '2010-10-19', color: 'red', age: 3)
Cat.create(name: 'Bubbles', birth_date: '2009-09-12', color: 'green', age: 7, sex: 'female')
Cat.create(name: 'Fluffy', birth_date: '2008-08-08', color: 'blue')

CatRentalRequest.create(cat_id: 1, begin_date: '2013-1-1', end_date: '2013-2-1', status: 'denied')
CatRentalRequest.create(cat_id: 1, begin_date: '2013-2-1', end_date: '2013-3-1', status: 'approved')
CatRentalRequest.create(cat_id: 2, begin_date: '2013-3-1', end_date: '2013-3-1', status: 'approved')

User.create(username: "bobbyjon", password: "12345")
User.create(username: "ronaldo", password: "2456")