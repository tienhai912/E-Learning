User.create! name: "z",email: "z@z.z",
  password: "zzzzzz", password_confirmation: "zzzzzz", is_admin: true

User.create! name: "y",email: "y@y.y",
  password: "yyyyyy", password_confirmation: "yyyyyy", is_admin: true

User.create! name: "x",email: "x@x.x",
  password: "xxxxxx", password_confirmation: "xxxxxx", is_admin: true

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name:  name, email: email, password: password,
    password_confirmation: password, is_admin: false
end

50.times do |n|
  category_name  = Faker::Name.name
  category_description = Faker::Hipster.sentence
  Category.create! name: category_name, description: category_description
end

50.times do |n|
  course_name  = Faker::Name.name
  course_description = Faker::Hipster.sentence
  Course.create! name: course_name, description: course_description, category_id: 1
end

50.times do |n|
  lesson_name  = Faker::Name.name
  Lesson.create! name: lesson_name, course_id: 1
end
