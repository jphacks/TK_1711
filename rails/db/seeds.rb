# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


for num in 1..10 do
    duration = rand(0..3)
    status = rand(0..2)
    containers = Container.create(name:"林さん",date:"2017-10-20",duration:duration,status:status)
end