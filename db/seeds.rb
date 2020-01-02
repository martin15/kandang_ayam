# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_or_create_by(email: "martin.me15@yahoo.com") do |user|
  user.name = "Martin"
  user.password_digest = BCrypt::Password.create('1q2w3e4r5t').to_s
end
puts user.inspect

user = User.find_or_create_by(email: "kandangayamid@gmail.com") do |user|
  user.name = "KA Admin"
  user.password_digest = BCrypt::Password.create('kandangayam2020').to_s
end
puts user.inspect

banner_1 = Banner.find_or_create_by(permalink: "mini-banner-1") do |banner|
  banner.image = File.new("#{Rails.root}/app/assets/images/mini-banner-1.png")
  puts banner.inspect
end
puts banner_1.errors.inspect
puts banner_1.inspect

banner_2 = Banner.find_or_create_by(permalink: "mini-banner-2") do |banner|
  banner.image = File.new("#{Rails.root}/app/assets/images/mini-banner-2.png")
end
puts banner_2.inspect

banner_3 = Banner.find_or_create_by(permalink: "mini-banner-3") do |banner|
  banner.image = File.new("#{Rails.root}/app/assets/images/mini-banner-3.png")
end
puts banner_3.inspect

banner_4 = Banner.find_or_create_by(permalink: "mini-banner-4") do |banner|
  banner.image = File.new("#{Rails.root}/app/assets/images/mini-banner-4.png")
end
puts banner_4.inspect

banner_5 = Banner.find_or_create_by(permalink: "mini-banner-5") do |banner|
  banner.image = File.new("#{Rails.root}/app/assets/images/mini-banner-5.png")
end
puts banner_5.inspect

banner_6 = Banner.find_or_create_by(permalink: "mini-banner-6") do |banner|
  banner.image = File.new("#{Rails.root}/app/assets/images/mini-banner-6.png")
end
puts banner_6.inspect
