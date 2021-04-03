FactoryBot.define do
    factory :comment  do
      association :user
      association :post
      comment               {"comment-sample"}                  
      created_at            { Time.zone.now }
      updated_at            { Time.zone.now }
    end
  end