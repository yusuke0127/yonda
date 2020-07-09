# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clearing database..."
Comment.destroy_all
Post.destroy_all

@yusuke = User.create!(
  email: "yusuke@gmail.com",
  password: "123456"
)

puts "Done creating yusuke"
5 times do
  post = Post.create!(
    title:
    content:
  )
end
