# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
    email: "example@railstutorial.org",
    password:              "foobar",
    password_confirmation: "foobar",
    admin:true,
    activated: true,
    activated_at: Time.zone.now
)

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now)
end

#ユーザーの一部を対象にマイクロポストを生成する
#ユーザーにorderメソッドを使い、作成された:created_atの最初の6人をtake(6)で呼び出す
users = User.order(:created_at).take(6)
#50回ループ 50.times do end
50.times do
    content = Faker::Lorem.sentence(word_count: 5)
    users.each{ |user| user.microposts.create!(content: content)}
end
