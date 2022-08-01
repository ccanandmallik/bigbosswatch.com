# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
#

initek = Company.create(name: 'Initek')

Post.find_or_create_by(
  company: initek,
  location_type: %i[office],
  media_type: %i[other audio],
  device_type: %i[other],
  certainty_type: %i[personal],
  policy_comm_type: %i[unknown],
  intent_type: %i[malevolent],
  maturity_type: %i[immature_legally],
  content: 'They took my red stapler, and that was my preferred stapler for stapling, and you see it was allowed
by the company, and after being told there was cake, I am now in the basement and its dark and cold and I think the roaches are telling Bill Lumburg when I\'m working, because I haven\'t been, this is because I cannot function at an adaquete pace without my red stapler, which they took, and now I\'m not receiving a paycheck, and the more I cannot pay my bills the more I think I need to, well, ok, you know. Yes, I am listening to music, at an approved volume, but sometimes I wonder if the music is listening to me, or if they have put a bug in the radio, because sometimes I will be sitting here, with my music playing, looking for my stapler, then thinking of how to approach Lumburg, to ask for my stapler, and I will make a plan slwoly, and everytime Mr. Lumburg gets away and the other day when there was cake, I couldn\'t have any because I was told to keep passing, I tried to talk to Mr. Lumburg about my paychecks, but he asked me about a work task, and the only way he would know, and yes I have my radio at an appropraite volume, but the only way he would know is if he was listening, so I\'m waiting for Peter to finish his third act and I can have some beverages on the beach and I will hope at that point Lumburg can hear me.',
  processed: true,
  approved: true
)

if ENV['DB_SEED'] && Rails.env.development?
  def sample_from(key)
    Post.send(key).keys.sample(rand(Post.send(key).size))
  end

  50.times do
    company = Company.create(name: Faker::Company.unique.name)

    rand(20..50).times do
      Post.create!(
        company: company,
        location_type: sample_from(:location_types),
        media_type: sample_from(:media_types),
        device_type: sample_from(:device_types),
        certainty_type: sample_from(:certainty_types),
        policy_comm_type: sample_from(:policy_comm_types),
        intent_type: sample_from(:intent_types),
        maturity_type: sample_from(:maturity_types),
        content: ProfanityFilter::Base.clean(Faker::ChuckNorris.fact),
        processed: true,
        approved: rand(100) > 40,
        user_ip: Faker::Internet.unique.ip_v4_address
      )
    end
  end
end
