

Cat.create(name: 'Isabel', birth_date: '2010-10-19', color: 'red', age: 3, user_id: 1)
Cat.create(name: 'Bubbles', birth_date: '2009-09-12', color: 'green', age: 7, sex: 'female', user_id: 2)
Cat.create(name: 'Fluffy', birth_date: '2008-08-08', color: 'blue', user_id: 1)

CatRentalRequest.create(cat_id: 1, begin_date: '2013-1-1', end_date: '2013-2-1', status: 'denied')
CatRentalRequest.create(cat_id: 1, begin_date: '2013-2-1', end_date: '2013-3-1', status: 'approved')
CatRentalRequest.create(cat_id: 2, begin_date: '2013-3-1', end_date: '2013-3-1', status: 'approved')

User.create(username: "bobbyjon", password: "12345")
User.create(username: "ronaldo", password: "2456")