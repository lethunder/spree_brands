FactoryGirl.define do
  factory :brand, class: Spree::Brand do
    name Faker::Name.name
    description Faker::Lorem.sentence(3)
    available_on DateTime.now
    active true
  end
end