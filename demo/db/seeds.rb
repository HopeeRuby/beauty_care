# frozen_string_literal: true

# Make seeds to test and demo
require 'faker'
require 'database_cleaner'

# DatabaseCleaner.strategy = :truncation
# DatabaseCleaner.clean

10.times do
  company = Company.create(name: Faker::Name.name, location: Faker::Company.bs)
  20.times do
    user = User.create(name: Faker::Name.name, email: Faker::Internet.email, company_id: company.id)
    Profile.create(
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.cell_phone,
      user_id: user.id
    )
  end
end

# check polymophic assosiation

30.times do
  course = Course.create(subject: Faker::Educator.course_name)
  lab = Lab.create(subject: Faker::Educator.course_name)
  3.times do
    Assistant.create(
      name: Faker::Name.name,
      commentable_id: course.id,
      commentable_type: Course
    )

    Assistant.create(
      name: Faker::Name.name,
      commentable_id: lab.id,
      commentable_type: Lab
    )
  end
end
