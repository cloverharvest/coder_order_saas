
User.create!(name: "Example User",
            email: "example@railstutorial.org",
            password: "fizzbuzz",
            password_confirmation: "fizzbuzz",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

50.times do |n|
  name = Faker::Name.name
  email = "coderrific-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password,
                activated: true,
                activated_at: Time.zone.now)
end


