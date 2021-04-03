FactoryBot.define do
    factory :user, aliases: [:post] do
      name                  {"sample"}
      email                 {"sample@gmail.com"}
      password              {"1234567a"}
      encrypted_password    {"1234567a"}  
      created_at            { Time.zone.now }
      updated_at            { Time.zone.now }
    end
  end