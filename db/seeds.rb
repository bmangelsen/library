# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hobbit = Book.create!(name: "The Hobbit", author: "Tolkien", isbn_no: "1234", description: "Pretty cool book")
lotr = Book.create!(name: "Lord of the Rings", author: "Tolkien", isbn_no: "1234", description: "Pretty cool book")

hobbit.reservations.create!(name: FFaker::Name.name, due_date: Date.new(2016,11,18))
lotr.reservations.create!(name: FFaker::Name.name, due_date: Date.new(2016,11,20))
