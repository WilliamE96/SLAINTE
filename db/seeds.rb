Message.destroy_all
Match.destroy_all
Post.destroy_all
User.destroy_all

users = [
  { email: 'user1@example.com', password: 'password', password_confirmation: 'password', username: 'Max', latitude: 51.5232, longitude: -0.0759 }, # Shoreditch High Street Station
  { email: 'user2@example.com', password: 'password', password_confirmation: 'password', username: 'Zoe', latitude: 51.5235, longitude: -0.0770 }, # Boxpark Shoreditch
  { email: 'user3@example.com', password: 'password', password_confirmation: 'password', username: 'Nik', latitude: 51.5198, longitude: -0.0752 }, # Old Spitalfields Market
  { email: 'user4@example.com', password: 'password', password_confirmation: 'password', username: 'Ella', latitude: 51.5224, longitude: -0.0739 }, # Shoreditch House
  { email: 'user5@example.com', password: 'password', password_confirmation: 'password', username: 'Ron', latitude: 51.5244, longitude: -0.0781 }, # Ace Hotel Shoreditch
  { email: 'user6@example.com', password: 'password', password_confirmation: 'password', username: 'Will', latitude: 51.5260, longitude: -0.0834 } # Le Wagon Shoreditch
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
  'night1.jpg',
  'night2.jpg',
  'night3.jpg',
  'night4.jpg',
  'night5.jpg',
  'night6.jpg'
]

user1.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_urls[0]) }
user2.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_urls[1]) }
user3.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_urls[2]) }
user4.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_urls[3]) }
user5.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_urls[4]) }
user6.posts.create!(content: 'First post!').tap { |post| attach_photo(post, photo_urls[5]) }

Match.create(user_id: user1.id, matched_user_id: user2.id, status: 'pending', created_at: Time.now, updated_at: Time.now)
