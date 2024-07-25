require 'dotenv'
Dotenv.load

puts "CLOUDINARY_CLOUD_NAME: #{ENV['CLOUDINARY_CLOUD_NAME']}"
puts "CLOUDINARY_API_KEY: #{ENV['CLOUDINARY_API_KEY']}"
puts "CLOUDINARY_API_SECRET: #{ENV['CLOUDINARY_API_SECRET']}"

Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUDINARY_CLOUD_NAME']
  config.api_key = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
  config.secure = true
end

puts "Cloud Name: #{Cloudinary.config.cloud_name}"
puts "API Key: #{Cloudinary.config.api_key}"
puts "API Secret: #{Cloudinary.config.api_secret}"
