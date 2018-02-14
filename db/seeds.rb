# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "cam", password: "pass", role: 1)
User.create!(username: "user", password: "password")

Category.create!(title: "category1")
Category.create!(title: "category2")
Category.create!(title: "category3")

Idea.create!(title: "title1", content: "idea 1", user_id: 1, category_id: 1)
Idea.create!(title: "title2", content: "idea 2", user_id: 1, category_id: 2)
Idea.create!(title: "title3", content: "idea 3", user_id: 2, category_id: 1)
Idea.create!(title: "title4", content: "idea 4", user_id: 2, category_id: 2)
Idea.create!(title: "title5", content: "idea 5", user_id: 2, category_id: 3)
