# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tank1 = Tank.create(resolution: 3, address: "http://192.168.0.22", position: "top", order: 1)
tank2 = Tank.create(resolution: 3, address: "http://192.168.0.22", position: "top", order: 2)
tank3 = Tank.create(resolution: 3, address: "http://192.168.0.22", position: "top", order: 3)
tank4 = Tank.create(resolution: 3, address: "http://192.168.0.22", position: "top", order: 4)
tank5 = Tank.create(resolution: 3, address: "http://192.168.0.22", position: "bottom", order: 1)
tank6 = Tank.create(resolution: 3, address: "http://192.168.0.22", position: "bottom", order: 2)
tank7 = Tank.create(resolution: 3, address: "http://192.168.0.22", position: "bottom", order: 3)
tank8 = Tank.create(resolution: 3, address: "http://192.168.0.22", position: "bottom", order: 4)


Level.create(tank: tank1, level: 0)
Level.create(tank: tank2, level: 0)
Level.create(tank: tank3, level: 0)
Level.create(tank: tank4, level: 0)
Level.create(tank: tank5, level: 0)
Level.create(tank: tank6, level: 0)
Level.create(tank: tank7, level: 0)
Level.create(tank: tank8, level: 0)