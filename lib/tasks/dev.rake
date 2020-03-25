# frozen_string_literal: true

namespace :dev do
  desc 'CONFIGURES DATA FOR DEVELOPMENT'
  task setup: :environment do
    puts 'Dropping...'
    `rake db:drop`
    puts 'Creating DB...'
    `rake db:create`
    puts 'Migrating...'
    `rake db:migrate`
    puts 'Seeding Real Data...'
    `rake db:seed`
    puts 'Seeding Fake Data...'
    `rake dev:fake_accredited_networks`
    `rake dev:fake_dummy_users`
    `rake dev:fake_benefits`
    `rake dev:fake_customers`
  end

  desc 'CREATE DUMMY USERS'
  task fake_dummy_users: :environment do
    customer = User.create!(email: 'customer@customer.com', password: '123123',
                            password_confirmation: '123123')
    customer.create_customer!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      cpf: Faker::Number.number(digits: 10),
      phone: Faker::PhoneNumber.phone_number,
      zipcode: Faker::Address.zip,
      address: Faker::Address.street_name,
      address_number: Faker::Address.secondary_address,
      address_complement: Faker::Address.building_number,
      address_neighbourhood: Faker::Address.community,
      city: Faker::Address.city,
      state: Faker::Address.state
    )
    company = User.create!(email: 'company@company.com', password: '123123',
                           password_confirmation: '123123')
    company.create_company!(
      about: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
      address: Faker::Address.street_name,
      address_number: Faker::Address.secondary_address,
      address_complement: Faker::Address.building_number,
      address_neighbourhood: Faker::Address.community,
      city: Faker::Address.city,
      state: Faker::Address.state,
      cnpj: Faker::Company.brazilian_company_number(formatted: true),
      latitude: '',
      longitude: '',
      name: Faker::Company.name,
      phone: Faker::PhoneNumber.phone_number,
      website: Faker::Internet.url,
      zipcode: Faker::Address.zip
    )
    default_admin = User.create!(email: 'admin@admin.com', password: '123123',
                                 password_confirmation: '123123')
    default_admin.create_admin!(
      name: 'Administrador Geral',
      phone: '123456'
    )

    default_admin.add_role(:admin)
    customer.add_role(:customer)
    company.add_role(:company)
  end

  desc 'CREATE FAKE ACCREDITED NETWORKS'
  task fake_accredited_networks: :environment do
    50.times do
      fake_accredited_network = User.create!(
        email: Faker::Internet.email,
        password: '123123',
        password_confirmation: '123123',
        approved: true
      )
      fake_accredited_network.add_role(:accredited_network)
      accredited_network = fake_accredited_network.create_accredited_network!(
        name: Faker::Company.name,
        about: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
        rules: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
        website: Faker::Internet.url,
        zipcode: Faker::Address.zip,
        cnpj: Faker::Company.brazilian_company_number(formatted: true),
        phone: Faker::PhoneNumber.phone_number,
        address: Faker::Address.street_name,
        address_number: Faker::Address.secondary_address,
        address_complement: Faker::Address.building_number,
        address_neighbourhood: Faker::Address.community,
        city: Faker::Address.city,
        state: Faker::Address.state,
        discount: Faker::Number.decimal(l_digits: 2),
        place_type: AccreditedNetwork.place_types.values.sample
      )
      3.times do
        accredited_network.categories << Category.all.sample
      end
    end
  end

  desc 'CREATE FAKE CUSTOMERS'
  task fake_customers: :environment do
    20.times do
      fake_customer_user = User.create!(
        email: Faker::Internet.email,
        password: '123123',
        password_confirmation: '123123',
        approved: true
      )
      fake_customer_user.add_role(:customer)
      fake_customer_user.create_customer!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        cpf: Faker::Number.number(digits: 10),
        phone: Faker::PhoneNumber.phone_number,
        zipcode: Faker::Address.zip,
        address: Faker::Address.street_name,
        address_number: Faker::Address.secondary_address,
        address_complement: Faker::Address.building_number,
        address_neighbourhood: Faker::Address.community,
        city: Faker::Address.city,
        state: Faker::Address.state
      )
    end
  end

  desc 'CREATE FAKE BENEFITS'
  task fake_benefits: :environment do
    100.times do
      Benefit.create!(
        product_name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph(sentence_count: 2),
        discount: 0,
        accredited_network_id: AccreditedNetwork.all.sample.id
      )
    end
  end

  desc 'CREATE FAKE PLANS'
  task fake_plans: :environment do
    plans = [{ name: 'Free' }, { name: 'Pago 1' }, { name: 'Pago 2' }]
    plans.each do |plan|
      Plan.create!(name: plan[:name])
    end
  end
end
