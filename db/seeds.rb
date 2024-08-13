require 'open-uri'

# Destroy existing records
Message.destroy_all
Match.destroy_all
Post.destroy_all
User.destroy_all

puts "creating 15 users"

# User data
users_data = [
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

# User profile photos
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

users = []
users_data.each_with_index do |user_data, index|
  user = User.create!(user_data)
  user.photo.attach(io: URI.open(user_photos[index]), filename: File.basename(user_photos[index]), content_type: 'image/jpg')
  puts "Created user: #{user.username}"
  users << user
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
  "Making memories!",

  "Unwinding with friends!",
  "Great vibes tonight!",
  "Exploring new spots.",
  "Toasting to good times!",
  "Whos up for a drink?",
  "Late-night adventures.",
  "Cheers to the weekend!",
  "Night out, anyone?",
  "Found a new favorite bar.",
  "Catching up over drinks.",
  "Making memories tonight!",
  "Spur-of-the-moment fun!",
  "Laughter all night!",
  "Drinks and good company.",
  "Enjoying the night air.",
  "Bar hop anyone?",
  "Let's paint the town red!",
  "Impromptu night out.",
  "Celebrating life!",
  "Ready for round two!",
  "Weekend fun, let's go!",
  "Drinks with a view.",
  "Perfect night for cocktails.",
  "Chasing good vibes.",
  "Unexpected fun tonight.",
  "Out and about.",
  "Making new friends!",
  "Cheers to new adventures.",
  "Loving the nightlife!",
  "Another round, please!",
  "Good times ahead!",
  "City lights and cocktails.",
  "Let's raise a glass!",
  "Exploring new places.",
  "Finding the best spots.",
  "Living in the moment.",
  "Tonight is the night!",
  "Gathering with friends.",
  "Happy hour, happy life.",
  "Cheers to the good life!",
  "Out with the crew.",
  "Sipping on something new.",
  "Let's keep the night going!",
  "Great music, great drinks.",
  "Enjoying every moment.",
  "Friends, fun, and laughter.",
  "A night to remember!",
  "Good drinks, good vibes.",
  "Making the most of it!",
  "Out and loving it!",
  "Let's make memories!",
  "Spontaneous adventures.",
  "Perfect end to the week.",
  "Drinks and deep talks.",
  "Living for the weekend.",
  "Up for an adventure?"
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
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558899/nereid-ndreu-7UghPZ7J0Io-unsplash_zzovfl.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558897/nereid-ndreu-GPyvoIhYreE-unsplash_csxagt.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558895/nate-holland-19ANCgLUSYY-unsplash_wnzfor.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558895/nima-sarram-908DsHNo6rQ-unsplash_ozzlcp.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558892/nate-johnston-5_0vOK9HPME-unsplash_pevapz.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558889/mattia-occhi-UC1GDKFIJ7I-unsplash_jduovw.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558887/michael-lee-6m_G_hsjIAI-unsplash_j2hyqp.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558886/mauro-lima-hzvzzRluWEA-unsplash_gphwwq.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558886/mike-von-rwWL5ZXdJlA-unsplash_kpth7i.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558886/michael-starkie-dbrN_VOcEZc-unsplash_oghieu.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558882/mohammad-kazemi-1b791TxKNe8-unsplash_a2llc4.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558876/matheus-frade-9VADsH0ulVQ-unsplash_axuaxf.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558875/markus-spiske-SXZnW6YZtV0-unsplash_xeb3fw.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558873/mario-verduzco-VjgH9ls5hcg-unsplash_ij5yff.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558865/krakenimages-7BpuzmcxlHU-unsplash_v8fdfi.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558864/lorin-both-y94ccsXcEmM-unsplash_kslskz.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558863/marie-michele-bouchard-Tyrz9TJi5dg-unsplash_xskaoq.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558862/linus-mimietz-QEpofCLA8wA-unsplash_jnixog.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558861/manny-moreno-Bw34iRCgmE4-unsplash_yhon4d.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558861/malen-almonacid-trossi-601X0jdpidA-unsplash_vn8iin.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558859/magnus-jonasson-zUuyLf2SHdw-unsplash_aep9ng.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558854/lawrence-chismorie-1oTixS9I4Rk-unsplash_b3sukc.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558854/karolina-marsalkova-CxqyJno3xcU-unsplash_hwf2aq.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558853/kristo-markou-MI-PtOkUQaU-unsplash_k62q91.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558852/jakob-owens-NUspCv0ZFZ8-unsplash_hk1og7.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558852/justin-aikin-x-6HB8_qE4A-unsplash_q8jzbo.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558851/kiryl-GWMv0kW_iuw-unsplash_vfohag.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558849/jia-jia-shum-zqjmsvNiFz8-unsplash_mr4h0t.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558848/jeppe-monster-Wz7Y61rqWwk-unsplash_foyarz.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558845/jakayla-toney-kWFi0ctdFGE-unsplash_tswhko.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558844/hudson-graves-PbqrmcqFQ54-unsplash_fqkfsg.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558844/jessie-mccall-D5DRFMTZF7w-unsplash_yqvg7f.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558843/isi-parente-SyArTS85OKA-unsplash_iyss8z.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558841/huesofdelahaye-delahaye-OPqW4m1SyvA-unsplash_cgsyd1.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558838/elevate-Q22rmldpgmc-unsplash_czrwuo.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558838/giorgio-trovato-PC5kB3fC1bM-unsplash_vsyc7n.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558838/florian-van-duyn-yR2Lu_3X4kg-unsplash_twjokr.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558837/fabio-alves-k0H4wpGhUw0-unsplash_efwhfl.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558836/himanshu-choudhary-cXKMlLCgCrw-unsplash_cmwqtq.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558834/elevate-54sHgcUa6t0-unsplash_nlk1ho.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558830/evan-wise-7BUauy9D5X0-unsplash_opc4ju.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558827/dylan-sauerwein-GCb0hd35DeE-unsplash_udzbdr.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558827/elevate-0KjVJ375hv4-unsplash_jmqcfm.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558822/elevate-Euyr_8yImIQ-unsplash_x4lzsd.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558819/elevate-048ogIf3Rk0-unsplash_odfr7a.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558818/elevate-_mKQMHfGjXY-unsplash_lhjmbx.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558815/cristi-ursea--2HXXtL1DCo-unsplash_w3acdt.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558811/blake-mccleary-dCzaNN-m6po-unsplash_nspx3l.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558811/brooke-cagle-oTweoxMKdkA-unsplash_dxi91l.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558809/deniz-demirci-8bzGFXqBp9M-unsplash_qccozh.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558807/abstral-official-CqjGwZ1JPsE-unsplash_ytieda.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558806/annie-spratt-WtEPaI4rgTo-unsplash_ophbx7.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558804/abstral-official-2S5VWdtngtI-unsplash_czffai.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558802/abstral-official-3kQbq1zfVH4-unsplash_eo02zn.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558798/abstral-official-Jq8JedAjyuQ-unsplash_bpj9bp.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558798/abstral-official-BGtDuc5qtAI-unsplash_xrle1m.jpg',
  'https://res.cloudinary.com/dah2rdyj2/image/upload/v1723558797/abstral-official-fwAT8_KCVQo-unsplash_ebbjkr.jpg'
]

# Shuffle the post_images array to ensure randomness
shuffled_images = post_images.shuffle

user_post_counts = Hash.new(0)

# Distribute images across users
shuffled_images.each_with_index do |image, index|
  # Find the user for the current image
  user = users[index % users.length]

  # Skip if user already has 5 posts
  next if user_post_counts[user.id] >= 5

  # Select a random post content
  post_content = post_contents.sample

  # Create the post and attach the image
  post = user.posts.create!(content: post_content)
  post.photo.attach(io: URI.open(image), filename: File.basename(image), content_type: 'image/jpg')

  # Increment the user's post count
  user_post_counts[user.id] += 1

  puts "Created post #{index + 1} for user #{user.username}: #{post.content}"
end

puts "Created #{Post.count} posts."

# Create 1 match
Match.create(user_id: User.first.id, matched_user_id: User.second.id, status: 'pending', created_at: Time.now, updated_at: Time.now)

puts "created #{Match.count} matches"
