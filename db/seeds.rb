# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_attributes = [
  {
    first_name: "Imageless",
    last_name: "User",
    username: "imageless_user",
    api_key: "secret_api_key"
  },
  {
    first_name: "Imageful",
    last_name: "User",
    username: "image_owner",
    api_key: "other_secret_key"
  },
  {
    first_name: "Super",
    last_name: "User",
    username: "superuser",
    is_superuser: true,
    api_key: "supersecret"
  }
]

users_attributes.each { |attribute| User.create_with_api_key(**attribute) }

images = Image.create([
  {
    title: "First image",
    user_id: User.find_by(username: "image_owner").id
  },
  {
    title: "Second image",
    user_id: User.find_by(username: "image_owner").id
  },
  {
    title: "Other image",
    user_id: User.find_by(username: "image_owner").id
  },
  {
    title: "Super image",
    user_id: User.find_by(username: "superuser").id
  }
])
