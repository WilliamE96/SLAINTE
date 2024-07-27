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

photo_urls = [
  'https://asset.cloudinary.com/dah2rdyj2/28aea771965e6c7e5d5b11cd0051c0f5',
  'https://asset.cloudinary.com/dah2rdyj2/71cc56ae9cde27518ba51cbcec117285',
  'https://res.cloudinary.com/your_cloud_name/image/upload/v1627301134/night3.jpg',
  'https://res.cloudinary.com/your_cloud_name/image/upload/v1627301134/night4.jpg',
  'https://res.cloudinary.com/your_cloud_name/image/upload/v1627301134/night5.jpg',
  'https://res.cloudinary.com/your_cloud_name/image/upload/v1627301134/night6.jpg'
]

user1.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_filenames[0]) }
user2.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_filenames[1]) }
user3.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_filenames[2]) }
user4.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_filenames[3]) }
user5.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_filenames[4]) }
user6.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_filenames[5]) }
