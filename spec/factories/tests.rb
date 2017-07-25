FactoryGirl.define do
  factory :test do
    user_id 1
    lesson_id 1
    created_at Time.now.to_datetime
  end
end
