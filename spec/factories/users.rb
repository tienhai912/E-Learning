FactoryGirl.define do
  factory :user do
    name "a"
    email "a@a.a"
    password "aaaaaa"
    password_confirmation "aaaaaa"
    is_admin false
  end

  factory :user2, class: User do
    name "b"
    email "b@b.b"
    password "bbbbbb"
    password_confirmation "bbbbbb"
    is_admin false
  end
end
