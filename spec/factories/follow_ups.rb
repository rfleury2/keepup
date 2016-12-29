FactoryGirl.define do
  factory :follow_up do
    association :contact
    send_date { Date.today + 7.days }
    completed false    
  end
end
