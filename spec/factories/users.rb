FactoryGirl.define do
  factory :user do
    name "a"
    email "a@a.a"
    password_digest "aaaaaa"
    remember_digest "aaaaaa"
    is_admin false
  end

  factory :user2, class: User do
    name "b"
    email "b@b.b"
    password_digest "bbbbbb"
    remember_digest "bbbbbb"
    is_admin false
  end
end
