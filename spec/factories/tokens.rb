FactoryGirl.define do
  factory :token do |f|
    f.token_type 0
    f.client_id "7d6cfd8c-8924-c676"
    f.message "I want a premium token"
  end
end
