# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "cam", password: "pass", role: 1)
User.create!(username: "user", password: "password")

Image.create!(url: "https://scontent.fapa1-2.fna.fbcdn.net/v/t1.0-9/19399236_10209692055399196_5882832153995701373_n.jpg?oh=49e99929c1e28d4918a6526c7c7febff&oe=5B19D77A")
Image.create!(url: "https://scontent.fapa1-2.fna.fbcdn.net/v/t31.0-8/17991372_10209168619113616_7426853693719897065_o.jpg?oh=f9850fcee39fe832b27406a989cf2e55&oe=5B1FEC78")
Image.create!(url: "https://scontent.fapa1-2.fna.fbcdn.net/v/t1.0-9/11069642_10204121475858189_6688698283881516434_n.jpg?oh=66b8a6719b1e5f379d93448679405d79&oe=5B0A7D51")

Category.create!(title: "category1")
Category.create!(title: "category2")
Category.create!(title: "category3")

Idea.create!(title: "title1", content: "idea 1", user_id: 1, category_id: 1)
Idea.create!(title: "title2", content: "idea 2", user_id: 1, category_id: 2)
Idea.create!(title: "title3", content: "idea 3", user_id: 2, category_id: 1)
Idea.create!(title: "title4", content: "idea 4", user_id: 2, category_id: 2)
Idea.create!(title: "title5", content: "idea 5", user_id: 2, category_id: 3)
