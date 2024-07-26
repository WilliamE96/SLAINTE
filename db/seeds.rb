
Post.destroy_all
User.destroy_all

users = [
  { email: 'user1@example.com', password: 'password', password_confirmation: 'password', username: 'user1' },
  { email: 'user2@example.com', password: 'password', password_confirmation: 'password', username: 'user2' },
  { email: 'user3@example.com', password: 'password', password_confirmation: 'password', username: 'user3' },
  { email: 'user4@example.com', password: 'password', password_confirmation: 'password', username: 'user4' },
  { email: 'user5@example.com', password: 'password', password_confirmation: 'password', username: 'user5' },
  { email: 'user6@example.com', password: 'password', password_confirmation: 'password', username: 'user6' }
]

users.each do |user|
  User.create!(user)
end

user1 = User.find_by(email: 'user1@example.com')
user2 = User.find_by(email: 'user2@example.com')
user3 = User.find_by(email: 'user3@example.com')
user4 = User.find_by(email: 'user4@example.com')
user5 = User.find_by(email: 'user5@example.com')
user6 = User.find_by(email: 'user6@example.com')

def attach_photo(post, filename)
  photo_path = Rails.root.join('app/assets/images/night', filename)
  post.photo.attach(io: File.open(photo_path), filename: filename)
end

photo_filenames = [
  'night1.jpg',
  'night2.jpg',
  'night3.jpg',
  'night4.jpg',
  'night5.jpg',
  'night6.jpg'
]

user1.posts.create!(content: 'Out at Cirque Le Soir, Join!').tap { |post| attach_photo(post, photo_filenames[0]) }
user2.posts.create!(content: 'on a crawl around shoreditch').tap { |post| attach_photo(post, photo_filenames[1]) }
user3.posts.create!(content: 'Lets drink').tap { |post| attach_photo(post, photo_filenames[2]) }
user4.posts.create!(content: 'At the Sugar Cane!').tap { |post| attach_photo(post, photo_filenames[3]) }
user5.posts.create!(content: 'Buy us some beers!').tap { |post| attach_photo(post, photo_filenames[4]) }
user6.posts.create!(content: 'Come out with us!!').tap { |post| attach_photo(post, photo_filenames[5]) }

#Uncomment when continuing with cloudinary
# photo_ids = [
#   'pexels-cottonbro-4781422_xrfwon',
#   'pexels-shkrabaanthony-4612246_ytbxrc',
#   'pexels-ron-lach-8922193_tnvov0',
#   'pexels-cottonbro-6530950_udruta',
#   'pexels-cottonbro-6530941_njnqhc',
#   'pexels-cottonbro-6530928_dxgs9h',
#   'pexels-cottonbro-5530167_nv3rg6',
#   'pexels-cottonbro-5530172_tzvinm',
#   'pexels-cottonbro-5097359_rlll7t',
#   'pexels-cottonbro-4781456_gdvxrc'
# ]

#Uncomment when continuing with cloudinary
# def attach_photo(post, photo_id)
#   photo_url = "https://www.pexels.com/photo/#{photo_id}"
#   photo_file = URI.open(photo_url)
#   post.photo.attach(io: photo_file, filename: "#{photo_id}.jpg")
# end


#Uncomment when continuing with cloudinary
# user1.posts.create!(content: 'First post!', photo: )
# user2.posts.create!(content: 'First post!', photo: )
# user3.posts.create!(content: 'First post!', photo: )
# user4.posts.create!(content: 'First post!', photo: )
# user5.posts.create!(content: 'First post!', photo: )
# user6.posts.create!(content: 'First post!', photo: )
