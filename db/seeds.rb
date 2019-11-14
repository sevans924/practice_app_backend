# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Beer.destroy_all
User.destroy_all
Rating.destroy_all



user_number = 20
beer_number = 20
rating_number = 20
    

user_number.times do
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.free_email,
      about_me: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      password_digest: Faker::Hipster.word
    )
  end

beer_number.times {
    beer = Beer.create(
        name: Faker::Hipster.word,
        abv: Faker::Number.within(range: 1..10),
        isOrganic: Faker::Boolean.boolean,
        category: Faker::Beer.style,
        description: Faker::Hipster.words(number: 2),
    )
}



rating_number.times {
  rating = Rating.create(
    beer_id: (1..beer_number).to_a.sample,
    user_id: (1..user_number).to_a.sample,
    rating_num: Faker::Number.within(range: 1..5),
    review: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true)
  )
}