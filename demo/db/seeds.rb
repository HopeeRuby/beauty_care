require 'faker'
require 'database_cleaner'

# DatabaseCleaner.strategy = :truncation
# DatabaseCleaner.clean

10.times do 
  company = Company.create(name: Faker::Name.name, location: Faker::Company.bs)
  10.times do
    User.create(company: company, name: Faker::Name.name, email: Faker::Internet.email, company_id: company.id)
  end
end