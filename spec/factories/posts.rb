FactoryBot.define do
    factory :post do
      association :user
      content               {"content"}
      user_id               {user.id}                  
      created_at            { Time.zone.now }
      updated_at            { Time.zone.now }
    end
  end