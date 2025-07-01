FactoryBot.define do
  factory :gift do
    sequence(:name) { |n| "Test name #{n}" }
    image_url { "http://example.com/image.png" }
    url { "http://example.com" }
  end
end
