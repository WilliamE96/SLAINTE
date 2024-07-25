
User.destroy_all

10.times do |i|
  User.create!(
    email: "user#{i}@example.com",
    password: 'password',
    username: "user#{i}"
  )

  
end
