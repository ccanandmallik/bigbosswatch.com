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

intertrode = Company.create(name: 'Intertrode')

Post.create(
  company: intertrode,
  location_type: %i[home],
  media_type: %i[audio video],
  device_type: %i[computer],
  certainty_type: %i[suspicion],
  policy_comm_type: %i[unknown],
  intent_type: %i[unknown],
  maturity_type: %i[immature_socially],
  content: 'They took my red stapler, and that was my preferred stapler for stapling, and you see it was allowed
by the company',
  processed: true,
  approved: true
)

if Rails.env.development?
  50.times do
    company = Company.create(name: Faker::Company.unique.name)

    rand(20..20).times do
      Post.create!(
        company: company,
        location_type: %i[home],
        media_type: %i[audio video],
        device_type: %i[computer],
        certainty_type: %i[suspicion],
        policy_comm_type: %i[unknown],
        intent_type: %i[unknown],
        maturity_type: %i[immature_socially],
        content: ProfanityFilter::Base.clean(Faker::ChuckNorris.fact),
        processed: true,
        approved: rand(100) > 40,
        user_ip: Faker::Internet.unique.ip_v4_address
      )
    end
  end
end
