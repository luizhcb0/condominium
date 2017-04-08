# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

box1 = Box.create(resolution: 3, address: "http://192.168.1.22")
box2 = Box.create(resolution: 3, address: "http://192.168.1.22")
box3 = Box.create(resolution: 3, address: "http://192.168.1.22")
box4 = Box.create(resolution: 3, address: "http://192.168.1.22")
box5 = Box.create(resolution: 3, address: "http://192.168.1.22")
box6 = Box.create(resolution: 3, address: "http://192.168.1.22")
box7 = Box.create(resolution: 3, address: "http://192.168.1.22")
box8 = Box.create(resolution: 3, address: "http://192.168.1.22")

Level.create(box: box1, level: 3)
Level.create(box: box1, level: 2)
Level.create(box: box1, level: 1)
Level.create(box: box1, level: 3)