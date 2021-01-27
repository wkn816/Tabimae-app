FactoryBot.define do
  factory :travel do
    id {1}
    user_id {1}
    name {"test"}
    transport {"train"}


    trait :invalid do
      user_id {nil}
      name {nil}
      transport{nil}
    end
  end
end