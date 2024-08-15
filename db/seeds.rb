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

shuffled_coordinates = [
  { latitude: 51.5102, longitude: -0.1341 }, # Soho
  { latitude: 51.5136, longitude: -0.1357 }, # Soho Square
  { latitude: 51.5145, longitude: -0.1400 }, # Carnaby Street
  { latitude: 51.5120, longitude: -0.1317 }, # Leicester Square
  { latitude: 51.5175, longitude: -0.1062 }, # Shoreditch
  { latitude: 51.5194, longitude: -0.0753 }, # Spitalfields
  { latitude: 51.5213, longitude: -0.0794 }, # Brick Lane
  { latitude: 51.5205, longitude: -0.0786 }, # Old Truman Brewery
  { latitude: 51.5207, longitude: -0.0842 }, # Hoxton
  { latitude: 51.5215, longitude: -0.0872 }, # Shoreditch High Street
  { latitude: 51.5138, longitude: -0.0982 }, # The Shard
  { latitude: 51.5085, longitude: -0.1257 }, # Covent Garden
  { latitude: 51.5110, longitude: -0.1222 }, # Trafalgar Square
  { latitude: 51.5095, longitude: -0.1271 }, # Leicester Square
  { latitude: 51.5152, longitude: -0.1419 }, # Soho House
  { latitude: 51.5142, longitude: -0.1435 }, # Dean Street
  { latitude: 51.5159, longitude: -0.1433 }, # Wardour Street
  { latitude: 51.5169, longitude: -0.1421 }, # Oxford Street
  { latitude: 51.5132, longitude: -0.1372 }, # Carnaby Street
  { latitude: 51.5068, longitude: -0.1269 }, # Waterloo Bridge
  { latitude: 51.5106, longitude: -0.1186 }, # The Strand
  { latitude: 51.5174, longitude: -0.1020 }, # Liverpool Street
  { latitude: 51.5185, longitude: -0.0814 }, # Spitalfields Market
  { latitude: 51.5228, longitude: -0.0815 }, # Columbia Road
  { latitude: 51.5239, longitude: -0.0781 }, # Redchurch Street
  { latitude: 51.5299, longitude: -0.1254 }, # Kings Cross
  { latitude: 51.5343, longitude: -0.1252 }, # Camden Town
  { latitude: 51.5401, longitude: -0.1447 }, # Camden High Street
  { latitude: 51.5410, longitude: -0.1469 }, # Chalk Farm Road
  { latitude: 51.5356, longitude: -0.1421 }, # Kentish Town
  { latitude: 51.5456, longitude: -0.1411 }, # Hampstead Heath
  { latitude: 51.5105, longitude: -0.1167 }, # Charing Cross
  { latitude: 51.5206, longitude: -0.0935 }, # Farringdon
  { latitude: 51.5219, longitude: -0.0987 }, # Clerkenwell
  { latitude: 51.5124, longitude: -0.0976 }, # Borough Market
  { latitude: 51.5118, longitude: -0.0832 }, # Monument
  { latitude: 51.5141, longitude: -0.0749 }, # Whitechapel
  { latitude: 51.5144, longitude: -0.0635 }, # Limehouse
  { latitude: 51.5024, longitude: -0.0865 }, # London Bridge
  { latitude: 51.5070, longitude: -0.0877 }, # Tower Bridge
  { latitude: 51.5101, longitude: -0.0749 }, # Tower Hill
  { latitude: 51.5054, longitude: -0.0753 }, # St. Katharine Docks
  { latitude: 51.5033, longitude: -0.1008 }, # Tate Modern
  { latitude: 51.5050, longitude: -0.0943 }, # Blackfriars
  { latitude: 51.5096, longitude: -0.1340 }, # Mayfair
  { latitude: 51.5089, longitude: -0.1425 }, # Regent Street
  { latitude: 51.5112, longitude: -0.1419 }, # Piccadilly Circus
  { latitude: 51.5154, longitude: -0.1270 }, # Fitzrovia
  { latitude: 51.5202, longitude: -0.1275 }, # Goodge Street
  { latitude: 51.5283, longitude: -0.1418 }, # Regent's Park
  { latitude: 51.5234, longitude: -0.1586 }, # Marylebone
  { latitude: 51.5255, longitude: -0.1620 }, # Baker Street
  { latitude: 51.5163, longitude: -0.1291 }, # Bloomsbury
  { latitude: 51.5206, longitude: -0.1246 }, # Russell Square
  { latitude: 51.5254, longitude: -0.1094 }, # Angel
  { latitude: 51.5265, longitude: -0.1106 }, # Upper Street
  { latitude: 51.5294, longitude: -0.1081 }, # Islington Green
  { latitude: 51.5283, longitude: -0.1062 }, # Essex Road
  { latitude: 51.5314, longitude: -0.1025 }, # Highbury
  { latitude: 51.5324, longitude: -0.1015 }, # Highbury Fields
  { latitude: 51.5351, longitude: -0.1002 }, # Arsenal
  { latitude: 51.5311, longitude: -0.0916 }, # Canonbury
  { latitude: 51.5195, longitude: -0.1460 }, # Marble Arch
  { latitude: 51.5099, longitude: -0.1486 }, # Hyde Park Corner
  { latitude: 51.5083, longitude: -0.1431 }, # Green Park
  { latitude: 51.5078, longitude: -0.1500 }, # Buckingham Palace
  { latitude: 51.5045, longitude: -0.1617 }, # Victoria
  { latitude: 51.4934, longitude: -0.1721 }, # Sloane Square
  { latitude: 51.4940, longitude: -0.1696 }, # Knightsbridge
  { latitude: 51.4975, longitude: -0.1745 }, # Chelsea
  { latitude: 51.4998, longitude: -0.1744 }, # South Kensington
].shuffle

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

shuffled_coordinates = [
  { latitude: 51.5102, longitude: -0.1341 }, # Soho
  { latitude: 51.5136, longitude: -0.1357 }, # Soho Square
  { latitude: 51.5145, longitude: -0.1400 }, # Carnaby Street
  { latitude: 51.5120, longitude: -0.1317 }, # Leicester Square
  { latitude: 51.5175, longitude: -0.1062 }, # Shoreditch
  { latitude: 51.5194, longitude: -0.0753 }, # Spitalfields
  { latitude: 51.5213, longitude: -0.0794 }, # Brick Lane
  { latitude: 51.5205, longitude: -0.0786 }, # Old Truman Brewery
  { latitude: 51.5207, longitude: -0.0842 }, # Hoxton
  { latitude: 51.5215, longitude: -0.0872 }, # Shoreditch High Street
  { latitude: 51.5138, longitude: -0.0982 }, # The Shard
  { latitude: 51.5085, longitude: -0.1257 }, # Covent Garden
  { latitude: 51.5110, longitude: -0.1222 }, # Trafalgar Square
  { latitude: 51.5095, longitude: -0.1271 }, # Leicester Square
  { latitude: 51.5152, longitude: -0.1419 }, # Soho House
  { latitude: 51.5142, longitude: -0.1435 }, # Dean Street
  { latitude: 51.5159, longitude: -0.1433 }, # Wardour Street
  { latitude: 51.5169, longitude: -0.1421 }, # Oxford Street
  { latitude: 51.5132, longitude: -0.1372 }, # Carnaby Street
  { latitude: 51.5068, longitude: -0.1269 }, # Waterloo Bridge
  { latitude: 51.5106, longitude: -0.1186 }, # The Strand
  { latitude: 51.5174, longitude: -0.1020 }, # Liverpool Street
  { latitude: 51.5185, longitude: -0.0814 }, # Spitalfields Market
  { latitude: 51.5228, longitude: -0.0815 }, # Columbia Road
  { latitude: 51.5239, longitude: -0.0781 }, # Redchurch Street
  { latitude: 51.5299, longitude: -0.1254 }, # Kings Cross
  { latitude: 51.5343, longitude: -0.1252 }, # Camden Town
  { latitude: 51.5401, longitude: -0.1447 }, # Camden High Street
  { latitude: 51.5410, longitude: -0.1469 }, # Chalk Farm Road
  { latitude: 51.5356, longitude: -0.1421 }, # Kentish Town
  { latitude: 51.5456, longitude: -0.1411 }, # Hampstead Heath
  { latitude: 51.5105, longitude: -0.1167 }, # Charing Cross
  { latitude: 51.5206, longitude: -0.0935 }, # Farringdon
  { latitude: 51.5219, longitude: -0.0987 }, # Clerkenwell
  { latitude: 51.5124, longitude: -0.0976 }, # Borough Market
  { latitude: 51.5118, longitude: -0.0832 }, # Monument
  { latitude: 51.5141, longitude: -0.0749 }, # Whitechapel
  { latitude: 51.5144, longitude: -0.0635 }, # Limehouse
  { latitude: 51.5024, longitude: -0.0865 }, # London Bridge
  { latitude: 51.5070, longitude: -0.0877 }, # Tower Bridge
  { latitude: 51.5101, longitude: -0.0749 }, # Tower Hill
  { latitude: 51.5054, longitude: -0.0753 }, # St. Katharine Docks
  { latitude: 51.5033, longitude: -0.1008 }, # Tate Modern
  { latitude: 51.5050, longitude: -0.0943 }, # Blackfriars
  { latitude: 51.5096, longitude: -0.1340 }, # Mayfair
  { latitude: 51.5089, longitude: -0.1425 }, # Regent Street
  { latitude: 51.5112, longitude: -0.1419 }, # Piccadilly Circus
  { latitude: 51.5154, longitude: -0.1270 }, # Fitzrovia
  { latitude: 51.5202, longitude: -0.1275 }, # Goodge Street
  { latitude: 51.5283, longitude: -0.1418 }, # Regent's Park
  { latitude: 51.5234, longitude: -0.1586 }, # Marylebone
  { latitude: 51.5255, longitude: -0.1620 }, # Baker Street
  { latitude: 51.5163, longitude: -0.1291 }, # Bloomsbury
  { latitude: 51.5206, longitude: -0.1246 }, # Russell Square
  { latitude: 51.5254, longitude: -0.1094 }, # Angel
  { latitude: 51.5265, longitude: -0.1106 }, # Upper Street
  { latitude: 51.5294, longitude: -0.1081 }, # Islington Green
  { latitude: 51.5283, longitude: -0.1062 }, # Essex Road
  { latitude: 51.5314, longitude: -0.1025 }, # Highbury
  { latitude: 51.5324, longitude: -0.1015 }, # Highbury Fields
  { latitude: 51.5351, longitude: -0.1002 }, # Arsenal
  { latitude: 51.5311, longitude: -0.0916 }, # Canonbury
  { latitude: 51.5195, longitude: -0.1460 }, # Marble Arch
  { latitude: 51.5099, longitude: -0.1486 }, # Hyde Park Corner
  { latitude: 51.5083, longitude: -0.1431 }, # Green Park
  { latitude: 51.5078, longitude: -0.1500 }, # Buckingham Palace
  { latitude: 51.5045, longitude: -0.1617 }, # Victoria
  { latitude: 51.4934, longitude: -0.1721 }, # Sloane Square
  { latitude: 51.4940, longitude: -0.1696 }, # Knightsbridge
  { latitude: 51.4975, longitude: -0.1745 }, # Chelsea
  { latitude: 51.4998, longitude: -0.1744 }, # South Kensington
].shuffle

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
  "That's what weekends are for!",
  "Looks like a great atmosphere!",
  "Hope you're enjoying!",
  "Looks like a chill spot!",
  "Perfect way to unwind!",
  "Night to remember!",
  "Looks like a lot of fun!",
  "Out and about!",
  "Great location!",
  "Where is that?",
  "Perfect night out!",
  "Hope you're having a blast!",
  "Good choice of venue!",
  "Enjoy the night!",
  "Cheers to the weekend!",
  "Nice spot!",
  "Out and about!",
  "Looks like a great night!",
  "Awesome night out!",
  "Making the most of it!",
  "That place looks fun!",
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


  # Select a unique set of coordinates for the post
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
  comments_for_post = comments.sample(rand(0..5)) # Randomly select 0 to 5 comments

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
