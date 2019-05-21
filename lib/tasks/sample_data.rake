require 'faker'

# Creates sample data for development
namespace :sample do
  desc 'Creates all sample data'
  task all: %i[consumers]

  desc 'Creates users with consumer profiles'
  task consumers: :environment do
    # Don't run in production
    return if ENV['NO_SAMPLE_DATA']

    puts 'Creating consumers profiles...'
    5.times do
      Consumer.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      )
    end

    puts 'Creating users...'
    profiles = Consumer.all
    profiles.each do |prof|
      User.create!(
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password',
        profile_type: 'Consumer',
        profile_id: prof.id
      )
    end

    puts "Done! #{User.count} Consumers created!"
  end

  desc 'Destroys all sample data'
  task clean: :environment do
    # Don't run in production
    return if ENV['NO_SAMPLE_DATA']

    puts 'Removing all sample data...'
    User.destroy_all
    Consumer.destroy_all
    puts 'Done!'
  end
end

