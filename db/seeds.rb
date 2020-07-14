# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Clearing database..."
User.destroy_all
Comment.destroy_all
Post.destroy_all


categories = %w[Advice Animals Art DIY Electronics Entertainment Fashion Food Funny Gaming Health Memes Music News Outdoors Photography Pics&GIFs Relationships Science Sports TV Tech Travel Video Games Videos Writing]
# Advice Animals Art DIY Electronics Entertainment Fashion Food Funny Gaming Health Memes Music News Outdoors Photography Pics & GIFs Relationships Science Sports TV Tech Travel Video Games Videos Writing

@yusuke = User.create!(
  email: "yusuke@gmail.com",
  password: "123456"
)

puts "Done creating yusuke"

100.times do
  post = Post.new(
    title: Faker::Book.title,
    content: Faker::Quote.famous_last_words,
    category_list: categories.sample
  )

  post.user = @yusuke
  post.save!
end

puts 'Done!'
