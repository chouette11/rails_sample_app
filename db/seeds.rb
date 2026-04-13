# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "fooobarr",
             password_confirmation: "fooobarr",
             admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password123"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
