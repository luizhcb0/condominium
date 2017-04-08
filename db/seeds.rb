# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

box1 = Box.create(resolution: 3, address: "http://192.168.1.22", position: "top", order: 1)
box2 = Box.create(resolution: 3, address: "http://192.168.1.22", position: "top", order: 2)
box3 = Box.create(resolution: 3, address: "http://192.168.1.22", position: "top", order: 3)
box4 = Box.create(resolution: 3, address: "http://192.168.1.22", position: "top", order: 4)
box5 = Box.create(resolution: 3, address: "http://192.168.1.22", position: "bottom", order: 1)
box6 = Box.create(resolution: 3, address: "http://192.168.1.22", position: "bottom", order: 2)
box7 = Box.create(resolution: 3, address: "http://192.168.1.22", position: "bottom", order: 3)
box8 = Box.create(resolution: 3, address: "http://192.168.1.22", position: "bottom", order: 4)


Level.create(box: box1, level: 3)
Level.create(box: box1, level: 2)
Level.create(box: box1, level: 1)
Level.create(box: box1, level: 3)