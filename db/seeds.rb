require 'open-uri'

Message.destroy_all
Match.destroy_all
Post.destroy_all
User.destroy_all

puts "creating 15 users"

users = [
  { email: 'partylover1@example.com', password: 'password', password_confirmation: 'password', username: 'SkyWatcher' },
  { email: 'drinkbuddy2@example.com', password: 'password', password_confirmation: 'password', username: 'OceanBreeze' },
  { email: 'socialsipper3@example.com', password: 'password', password_confirmation: 'password', username: 'MountainTrekker' },
  { email: 'barhopper4@example.com', password: 'password', password_confirmation: 'password', username: 'UrbanExplorer' },
  { email: 'nightout5@example.com', password: 'password', password_confirmation: 'password', username: 'CoffeeLover' },
  { email: 'taptime6@example.com', password: 'password', password_confirmation: 'password', username: 'Bookworm88' },
  { email: 'goodtimes7@example.com', password: 'password', password_confirmation: 'password', username: 'StarGazer' },
  { email: 'cheers8@example.com', password: 'password', password_confirmation: 'password', username: 'GreenThumb' },
  { email: 'pubgoer9@example.com', password: 'password', password_confirmation: 'password', username: 'TechGuru' },
  { email: 'clublife10@example.com', password: 'password', password_confirmation: 'password', username: 'Wanderlust' },
  { email: 'lastcall11@example.com', password: 'password', password_confirmation: 'password', username: 'CityLights' },
  { email: 'barfly12@example.com', password: 'password', password_confirmation: 'password', username: 'QuietStorm' },
  { email: 'socialite13@example.com', password: 'password', password_confirmation: 'password', username: 'SilverLining' },
  { email: 'chillvibes14@example.com', password: 'password', password_confirmation: 'password', username: 'MellowYellow' },
  { email: 'drinksession15@example.com', password: 'password', password_confirmation: 'password', username: 'ChasingDreams' }
]

user_photos = [
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723560393/austin-distel-qgdJX9mvMJI-unsplash_ycvrrs.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723560391/thierry-lemaitre-HRNDJkOGZ9Q-unsplash_qaxgow.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723560391/andreea-avramescu-gJeVwaiZs30-unsplash_hwdpua.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723560390/roth-melinda-KwQltmv7dhI-unsplash_spwtzz.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723560390/barnabas-lartey-odoi-tetteh-tW92VzfPEW4-unsplash_r0dnpp.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723560385/joseph-gonzalez-iFgRcqHznqg-unsplash_qwblls.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723560385/michael-dam-mEZ3PoFGs_k-unsplash_jxvku5.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723560384/masi-mohammadi-FgGVblkZTyA-unsplash_bwhvhp.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723560380/charlesdeluvio-kVg2DQTAK7c-unsplash_rof2hd.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723560378/abdullah-ali-uTJ-V0SBD2A-unsplash_zb2icb.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723562170/ali-jouyandeh-0iGupFbZjtY-unsplash_kg74ks.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723562175/nenad-protic-iwAs9Q6j9_Q-unsplash_m5juwk.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723562176/nenad-protic-RuBaOBU3U0w-unsplash_sqc2tq.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723562177/arto-suraj-w7oxhn3IiTE-unsplash_c3qspg.jpg",
  "https://res.cloudinary.com/dah2rdyj2/image/upload/v1723562178/amirhosein-jahangir-l---BDuAGa8-unsplash_msuj77.jpg"
]


users.each_with_index do |user_data, index|
  user = User.create!(user_data)
  user.photo.attach(io: URI.open(user_photos[index]), filename: File.basename(user_photos[index]), content_type: 'image/jpg')
  puts "Created user: #{user.username}"
end


post_contents = [
  "Weekend vibes!",
  "New bar in town, join?",
  "Amazing night out!",
  "Drinks this weekend?",
  "Friday night vibes.",
  "Trying new cocktails!",
  "Late night fun!",
  "Chilling at the pub.",
  "Drinks on me tonight!",
  "Spontaneous outing!",
  "Great company, great drinks.",
  "Perfect evening.",
  "Cheers to a great night!",
  "Meeting for drinks, join us!",
  "Making memories!"
]


post_images = [
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558925/zac-meadowcroft-U9tPtU0MFHE-unsplash_a0qvxq.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558924/vitalii-khodzinskyi-XJSpiOEQjhY-unsplash_htxa8g.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558923/ourwhisky-foundation-57I9IeS9RBA-unsplash_xvwkmv.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558922/sangria-senorial-RCqip3zVKOM-unsplash_sq2q1s.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558922/vale-6yq-QpQH3EU-unsplash_qrqhuf.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558922/thanos-pal-s_IjRVI9lXA-unsplash_o4tujc.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558919/sebastian-pociecha-veTirKn_l40-unsplash_sqz0ku.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558918/sushil-nash-Z8G8zXIqQks-unsplash_nvdrdo.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558917/ourwhisky-foundation-4SKNDU85KOw-unsplash_w1jqvb.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558914/sexto-abismo-ginebra-surrealista-W7LNMKo6-qc-unsplash_ofojxf.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558912/ourwhisky-foundation-oN2iSlIZlIk-unsplash_pssp5s.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558911/omid-armin-UVx7Xx_b4a0-unsplash_tfnyi7.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558910/nereid-ndreu-A3gKaBbe1rY-unsplash_kgawbe.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558904/nereid-ndreu-ngmUNM7cAQA-unsplash_ast8bh.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558899/nereid-ndreu-7UghPZ7J0Io-unsplash_zzovfl.jpg'
]

users = User.all
users.each_with_index do |user, index|
  post = user.posts.create!(content: post_contents[index % post_contents.length])
  post.photo.attach(io: URI.open(post_images[index % post_images.length]), filename: File.basename(post_images[index]), content_type: 'image/jpg')
  puts "Created post for user #{user.username}: #{post.content}"
end

puts "Created #{Post.count} posts."

puts "create 1 match"

# Creating a match between the first two users
Match.create(user_id: User.first.id, matched_user_id: User.second.id, status: 'pending', created_at: Time.now, updated_at: Time.now)

puts "created #{Match.count} matches"
