FactoryBot.define do
    factory :user, aliases: [:post] do
      name                  {"sample"}
      email                 {"sample@gmail.com"}
      password              {"1234567"}
      encrypted_password    {"1234567"}  
      created_at            { Time.zone.now }
      updated_at            { Time.zone.now }
    end
  end