FactoryGirl.define do
  factory :brand, class: Spree::Brand do
    name Faker::Name.name
    description Faker::Lorem.sentence(3)
    available_on DateTime.now
    active true
    image_file_name 'test.png'
    image_content_type 'image/png'
    image_file_size 4096
  end
end