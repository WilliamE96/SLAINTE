require 'open-uri'

# Destroy existing records
Message.destroy_all
Match.destroy_all
Post.destroy_all
User.destroy_all
Like.destroy_all
Comment.destroy_all

puts "creating 15 users"

users_data = [
  { email: 'sabatino1@example.com', password: 'password', password_confirmation: 'password', username: 'SabatinoC' },
  { email: 'william2@example.com', password: 'password', password_confirmation: 'password', username: 'WilliamE' },
  { email: 'socialsipper3@example.com', password: 'password', password_confirmation: 'password', username: 'AlexRider07' },
  { email: 'barhopper4@example.com', password: 'password', password_confirmation: 'password', username: 'BellaBlue42' },
  { email: 'nightout5@example.com', password: 'password', password_confirmation: 'password', username: 'SamTheMan18' },
  { email: 'taptime6@example.com', password: 'password', password_confirmation: 'password', username: 'GraceSwift23' },
  { email: 'goodtimes7@example.com', password: 'password', password_confirmation: 'password', username: 'NickNinja55' },
  { email: 'cheers8@example.com', password: 'password', password_confirmation: 'password', username: 'ZoeWildCat66' },
  { email: 'pubgoer9@example.com', password: 'password', password_confirmation: 'password', username: 'EthanStorm88' },
  { email: 'clublife10@example.com', password: 'password', password_confirmation: 'password', username: 'MiaSkyline21' },
  { email: 'lastcall11@example.com', password: 'password', password_confirmation: 'password', username: 'JackHammer33' },
  { email: 'barfly12@example.com', password: 'password', password_confirmation: 'password', username: 'EllaMoon77' },
  { email: 'socialite13@example.com', password: 'password', password_confirmation: 'password', username: 'LeoThunder19' },
  { email: 'chillvibes14@example.com', password: 'password', password_confirmation: 'password', username: 'AvaNova44' },
  { email: 'drinksession15@example.com', password: 'password', password_confirmation: 'password', username: 'OwenKnight05' }
]

# Static photos for SabatinoC and WilliamE
static_photos = {
  'SabatinoC' => "https://res.cloudinary.com/dah2rdyj2/image/upload/v1725569917/profile_tdysdf.jpg",
  'WilliamE' => "https://res.cloudinary.com/dah2rdyj2/image/upload/v1725569961/download11_xnw19e.jpg"
}

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

  # Assign static photos to SabatinoC and WilliamE
  if static_photos[user.username]
    photo_url = static_photos[user.username]
  else
    # Assign random photos to other users
    photo_url = user_photos[index]
  end

  # Attach the correct photo
  user.photo.attach(io: URI.open(photo_url), filename: File.basename(photo_url), content_type: 'image/jpg')
  puts "Created user: #{user.username}"
  users << user
end

post_contents = [
  "Weekend vibes!",
  "New bar in town.",
  "Amazing night out!",
  "Drinks this weekend?",
  "Friday night vibes.",
  "Trying new cocktails!",
  "Late night fun!",
  "Chilling at the pub.",
  "Drinks on me!",
  "Spontaneous outing!",
  "Great company.",
  "Perfect evening.",
  "Cheers!",
  "Meeting for drinks.",
  "Making memories!",
  "With friends!",
  "Great vibes tonight!",
  "Exploring new spots.",
  "Toasting,good times!",
  "Up for a drink?",
  "Night adventures.",
  "Cheers, the weekend!",
  "Night out, anyone?",
  "Found a new bar.",
  "Catching up on drinks.",
  "Making memories!",
  "fun!",
  "Laughter all night!",
  "Drinks and company.",
  "The night air.",
  "Bar hop anyone?",
  "Let's paint the town!",
  "Impromptu night out.",
  "Celebrating life!",
  "Ready for round two!",
  "Let's go!",
  "Drinks with a view.",
  "Night for cocktails.",
  "Chasing good vibes.",
  "Unexpected night.",
  "Out and about.",
  "Making new friends!",
  "Cheers",
  "Loving the night!",
  "Another round",
  "Good times ahead!",
  "Cocktails.",
  "A glass!",
  "Exploring places.",
  "Best spots.",
  "Living.",
  "Tonight!",
  "Friends.",
  "Happy hour.",
  "To the good life!",
  "Out with the crew.",
  "Something new.",
  "Keep the night going!",
  "Great drinks.",
  "Enjoying every moment.",
  "Fun and laughter.",
  "A night to remember!",
  "Good vibes.",
  "Making the most of it!",
  "Out and loving it!",
  "Let's make memories!",
  "Adventures.",
  "Perfect!.",
  "Drinks.",
  "Living.",
  "Up for an adventure?"
]

shuffled_coordinates = [
  { latitude: 51.569916, longitude: -0.137757 },
  { latitude: 51.574567, longitude: -0.137976 },
  { latitude: 51.549448, longitude: -0.176133 },
  { latitude: 51.579485, longitude: -0.180861 },
  { latitude: 51.589739, longitude: -0.083447 },
  { latitude: 51.542097, longitude: -0.036831 },
  { latitude: 51.575551, longitude: 0.02674 },
  { latitude: 51.596561, longitude: -0.034969 },
  { latitude: 51.576714, longitude: -0.041553 },
  { latitude: 51.534082, longitude: 0.050096 },
  { latitude: 51.588168, longitude: -0.12733 },
  { latitude: 51.596894, longitude: 0.047962 },
  { latitude: 51.565028, longitude: -0.197816 },
  { latitude: 51.535785, longitude: -0.167937 },
  { latitude: 51.555822, longitude: -0.14171 },
  { latitude: 51.576827, longitude: -0.184514 },
  { latitude: 51.591604, longitude: -0.093146 },
  { latitude: 51.577896, longitude: -0.084297 },
  { latitude: 51.553967, longitude: -0.085051 },
  { latitude: 51.563253, longitude: -0.135708 },
  { latitude: 51.558502, longitude: -0.216924 },
  { latitude: 51.542121, longitude: -0.222173 },
  { latitude: 51.583919, longitude: -0.053436 },
  { latitude: 51.543182, longitude: -0.207133 },
  { latitude: 51.561153, longitude: 0.050237 },
  { latitude: 51.546929, longitude: -0.202705 },
  { latitude: 51.581923, longitude: -0.073802 },
  { latitude: 51.565533, longitude: -0.120793 },
  { latitude: 51.568215, longitude: 0.054692 },
  { latitude: 51.540526, longitude: -0.051066 },
  { latitude: 51.575871, longitude: -0.14402 },
  { latitude: 51.570119, longitude: -0.186703 },
  { latitude: 51.594065, longitude: -0.233524 },
  { latitude: 51.530864, longitude: -0.143363 },
  { latitude: 51.594038, longitude: 0.025927 },
  { latitude: 51.551771, longitude: -0.221577 },
  { latitude: 51.546448, longitude: -0.146331 },
  { latitude: 51.56648, longitude: -0.218642 },
  { latitude: 51.576478, longitude: -0.174917 },
  { latitude: 51.578645, longitude: 0.007219 },
  { latitude: 51.540484, longitude: -0.164589 },
  { latitude: 51.590309, longitude: -0.110645 },
  { latitude: 51.563116, longitude: -0.010392 },
  { latitude: 51.561708, longitude: -0.000821 },
  { latitude: 51.556249, longitude: -0.108199 },
  { latitude: 51.576738, longitude: -0.060532 },
  { latitude: 51.588014, longitude: -0.109785 },
  { latitude: 51.597762, longitude: -0.098329 },
  { latitude: 51.558667, longitude: -0.070362 },
  { latitude: 51.539496, longitude: 0.018097 },
  { latitude: 51.578897, longitude: -0.200799 },
  { latitude: 51.57965, longitude: -0.170226 },
  { latitude: 51.591517, longitude: -0.150264 },
  { latitude: 51.596369, longitude: -0.224648 },
  { latitude: 51.572953, longitude: -0.099832 },
  { latitude: 51.555845, longitude: -0.188864 },
  { latitude: 51.543161, longitude: -0.229859 },
  { latitude: 51.557414, longitude: -0.214431 },
  { latitude: 51.568851, longitude: 0.04277 },
  { latitude: 51.584572, longitude: -0.134242 },
  { latitude: 51.572883, longitude: -0.094356 },
  { latitude: 51.538518, longitude: 0.012783 },
  { latitude: 51.585453, longitude: -0.170945 },
  { latitude: 51.577745, longitude: -0.197837 },
  { latitude: 51.529622, longitude: -0.223154 },
  { latitude: 51.565448, longitude: -0.111611 },
  { latitude: 51.580606, longitude: -0.139055 },
  { latitude: 51.562266, longitude: -0.114977 },
  { latitude: 51.58168, longitude: -0.06972 },
  { latitude: 51.560082, longitude: -0.097834 },
  { latitude: 51.566484, longitude: -0.071953 },
  { latitude: 51.534941, longitude: -0.06257 },
  { latitude: 51.585204, longitude: -0.067263 },
  { latitude: 51.537651, longitude: 0.001615 },
  { latitude: 51.592828, longitude: -0.18711 }
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

comments = [
  "Looks like a fun night!",
  "Great vibes!",
  "Enjoy your night!",
  "That spot looks cool!",
  "Hope you're having a great time!",
  "Nice place!",
  "Wish I was there!",
  "Have a drink for me!",
  "Looks like a good time!",
  "Cheers to a great night!",
  "Living it up!",
  "That's the way to spend a night!",
  "Out and about!",
  "Enjoy the night!",
  "Looks like a perfect evening!",
  "Good times for sure!",
  "Keep the good vibes going!",
  "Looks like a blast!",
  "Where's the invite?",
  "Nice night out!",
  "That place looks awesome!",
  "Looks like you're having fun!",
  "Great shot!",
  "Perfect night for it!",
  "Looks like a great crew!",
  "Good times!",
  "Great view!",
  "Awesome spot!",
  "Looks like a good crowd!",
  "Enjoy every moment!",
  "Wish I could be there!",
  "Living your best life!",
  "Night out well spent!",
  "That's what weekends",
  "Good times ahead!",
  "Hope you're enjoying!",
  "Looks like a lively spot!",
  "Great night!",
  "Perfect way to spend an evening!",
  "Night out vibes!",
  "Looks like a great night out!",
  "Awesome venue!",
  "Good times!",
  "That spot looks great!",
  "Where's that?",
  "Making the most of the night!",
  "Enjoying the evening!",
  "Out on the town!",
  "Looks like a cool place!",
  "Hope you're having fun!",
  "Great night out!",
  "Perfect way to start the weekend!",
  "Looks like a great crowd!",
  "Living it up!",
  "Hope the night is treating you well!",
  "Enjoy the night out!",
  "Cheers to a fun night!",
  "That's the way to do it!",
  "Out with friends!",
  "Looks like a good time!",
  "Perfect night out!",
  "Hope you're having a good one!",
  "Out on the town!",
  "Great spot!",
  "Nice night for it!",
  "Hope you're enjoying the night!",
  "Great atmosphere!",
  "Night out essentials!",
  "Where are you?",
  "Enjoy the night!",
  "Living the good life!",
  "Great vibes!",
  "Hope you're having a blast!",
  "Good choice of place!",
  "Night out!",
  "Looks like a great spot!",
  "Enjoying the night!",
  "Out and about!",
  "Good times rolling!",
  "Hope you're having a good time!",
  "Nice night out!",
  "Out and about!",
  "Where is that?",
  "Looks like a great night out!",
  "Cheers to the weekend!",
  "Out for the night!",
  "Enjoying the night out!",
  "Perfect spot!",
  "Hope you're having fun!",
  "That looks like a good time!",
  "Night well spent!",
  "Making memories!",
  "Out with the crew!",
  "Great location!",
  "Hope you're enjoying!",
  "Cheers to a good night!",
  "Good choice!",
  "That place looks cool!",
  "Enjoy the night!",
  "Out on the town!",
  "Looks like a perfect night!",
  "Night out vibes!",
  "Where are you headed?",
  "That spot looks fun!",
  "Out for the night!",
  "Living it up!",
  "Cheers to a great night!",
  "Making the most of it!",
  "Hope the night is treating you well!",
  "Out with friends!",
  "Looks like a fun time!",
  "Night out essentials!",
  "Great night ahead!",
  "Good vibes only!",
  "Out and about!",
  "Making the most of the night!",
  "That spot looks awesome!",
  "Hope you're having a blast!",
  "Great night out!",
  "Enjoy the evening!",
  "Looks like a good time!",
  "Night to remember!",
  "Out on the town!",
  "Living your best life!",
  "Where is that place?"
]

# Shuffle the post_images array to ensure randomness
shuffled_images = post_images.shuffle

user_post_counts = Hash.new(0)

# Distribute images across users and create posts
shuffled_images.each_with_index do |image, index|
  user = users[index % users.length]

  next if user_post_counts[user.id] >= 5

  post_content = post_contents.sample
  coordinates = shuffled_coordinates[index]

  # Create the post with the coordinates and attach the image
  post = user.posts.create!(content: post_content, latitude: coordinates[:latitude], longitude: coordinates[:longitude])
  post.photo.attach(io: URI.open(image), filename: File.basename(image), content_type: 'image/jpg')

  user_post_counts[user.id] += 1

  puts "Created post #{index + 1} for user #{user.username}: #{post.content} at #{coordinates[:latitude]}, #{coordinates[:longitude]}"

  rand(5..30).times do
    liker = User.all.sample
    post.likes.create!(user: liker)
  end

  puts "Added likes to post #{post.id}: #{post.likes.count} likes"

  comments_for_post = comments.sample(rand(0..5))

  # Add random comments to the post
  comments_for_post.each do |comment_content|
    commenter = User.all.sample
    post.comments.create!(user: commenter, content: comment_content)
  end

  puts "Added comments to post #{post.id}: #{post.comments.count} comments"
end

puts "Created #{Post.count} posts."
puts "Created #{Like.count} likes."
puts "Created #{Comment.count} comments."

Match.create(user_id: User.first.id, matched_user_id: User.second.id, status: 'pending', created_at: Time.now, updated_at: Time.now)

puts "Created #{Match.count} match."
