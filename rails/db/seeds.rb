# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# for num in 1..10 do
    # duration = rand(0..3)
    # status = rand(0..2)
#     containers = user.containers.create(name:"林さん",date:"2017-10-20",duration:duration,status:status)
# end


duration = rand(0..3)
status = rand(0..2)
user1 = User.create(name:"川上",address:"0xe8047fe4612bdaff46ef896cb87fff10a68b52ec",balance:1000)
containers1 = user1.containers.create(name:"ソファ",date:"2017-10-20",photo:"https://s3-ap-northeast-1.amazonaws.com/myblock/sofa.jpg",duration:duration,status:status)
duration = rand(0..3)
status = rand(0..2)

user2 = User.create(name:"山田",address:"0x21ab4b628bd3af3bcfa38d18cf8de3d243026956",balance:3000)
for num in 1..5 do
    containers2 = user2.containers.create(name:"グラノーラ",date:"2017-10-20",photo:"https://s3-ap-northeast-1.amazonaws.com/myblock/gura.png",duration:duration,status:status)
end
duration = rand(0..3)
status = rand(0..2)
containers2 = user2.containers.create(name:"7up",date:"2017-10-20",photo:"https://s3-ap-northeast-1.amazonaws.com/myblock/7up.jpg",duration:duration,status:status)
duration = rand(0..3)
status = rand(0..2)
containers2 = user2.containers.create(name:"ソファ",date:"2017-10-20",photo:"https://s3-ap-northeast-1.amazonaws.com/myblock/sofa.jpg",duration:duration,status:status)

duration = rand(0..3)
status = rand(0..2)
user3 = User.create(name:"林",address:"0x786971589e24ca1d42ba813c0bd26936081b2085",balance:3502)
containers3 = user3.containers.create(name:"プロテイン",date:"2017-10-20",photo:"https://s3-ap-northeast-1.amazonaws.com/myblock/protain.png",duration:duration,status:status)

duration = rand(0..3)
status = rand(0..2)
user4 = User.create(name:"さくま農家",address:"0x0b9d052652f94547464746a08e8281cd7aa6e059",balance:6000)
containers4 = user4.containers.create(name:"7up",date:"2017-10-20",photo:"https://s3-ap-northeast-1.amazonaws.com/myblock/7up.jpg",duration:duration,status:status)
duration = rand(0..3)
status = rand(0..2)

user5 = User.create(name:"島根牧場",address:"0xc90b4266ac60846f20aade24978a57f60e4a81ba",balance:7000)
for num in 1..5 do
    containers5 = user5.containers.create(name:"カップ麺詰め替えセット", date:"2017-10-20",photo:"https://s3-ap-northeast-1.amazonaws.com/myblock/cupmen.jpg",duration:duration,status:status)
end