# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



items = ["学習", "運動", "就活"]

items.each do |item|
  Tag.create!(name: "#{item}")
end


3.times do |n|
  user = User.create!(
    email: "user00#{n + 1}@test.com",
    password: "test1234"
  )


    50.times do |n|
      articles = user.articles.create!(

      title: "No.#{n + 1}: user00#{user.id}の記事",
      content: "No.#{n + 1}: user00#{user.id}の記事の本文",
      )
      # binding.pry
      articles.tag_ids = Tag.all.pluck(:id)

    end
end
