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

lessons = Lesson.order(:created_at).take 6
20.times do
  content = Faker::Lorem.sentence 5
  lessons.each {|lesson| lesson.words.create! content: content, kind: 1}
end

20.times do
  content = Faker::Lorem.sentence 5
  lessons.each {|lesson| lesson.words.create! content: content, kind: 2}
end

words = Word.order(:created_at).take 6
1.times do
  content = Faker::Lorem.sentence 5
  words.each {|word| word.answers.create! content: content, word_id: word.id, is_correct: true}
end
3.times do
  content = Faker::Lorem.sentence 5
  words.each {|word| word.answers.create! content: content, word_id: word.id, is_correct: false}
end

words_with_two_answers = [120,121,122,123,124]
words2 = Word.where("id IN (?)", words_with_two_answers)
2.times do
  content = Faker::Lorem.sentence 5
  words2.each {|word| word.answers.create! content: content, word_id: word.id, is_correct: true}
end
2.times do
  content = Faker::Lorem.sentence 5
  words2.each {|word| word.answers.create! content: content, word_id: word.id, is_correct: false}
end
