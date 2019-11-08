# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Shema', email: 'shema@gmail.com', password: 'shema123')
User.create(name: 'Prince', email: 'prince@gmail.com', password: 'prince',admin: 'true')
Label.create(title: 'Label1', user_id: '1')
Label.create(title: 'Label2', user_id: '1')
Label.create(title: 'Label3', user_id: '2')
Label.create(title: 'Label4', user_id: '2')
