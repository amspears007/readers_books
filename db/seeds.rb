# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

  Book.destroy_all
  Reader.destroy_all

  amy = Reader.create!(name: "Amy", age:40, avid_reader: false)
  todd = Reader.create!(name: "Todd", age:45, avid_reader: true)
  penny = Reader.create!(name: "Penny", age:8, avid_reader: false)
  vivian = Reader.create!(name: "Vivian", age:5, avid_reader: true)

  
  plum_creek = amy.books.create!(title: "On the Banks of Plum Creek",
                                author:"Laura Ingalls Wilder", 
                                genre: "children's historical novels", 
                                year_written: 1937, 
                                fiction: true)
  gone = amy.books.create!(title: "Then She was Gone",
                          author:"Lisa Jewell", 
                          genre: "thriller", 
                          year_written: 2017, 
                          fiction: true)
  deep_work = amy.books.create!(title: "Deep Work",
                                author:"Cal Newport", 
                                genre: "self help", 
                                year_written: 2016, 
                                fiction: false)
  bossy = amy.books.create!(title: "Bossypants", 
                            author: "Tina Fay", 
                            genre: "autobiographical comedy", year_written: 2020, 
                            fiction: false)

  metal = todd.books.create!(title: "The Lost Metal",
                            author:"Brandon Sanderson", 
                            genre: "fantasy", 
                            year_written: 2022, 
                            fiction: true)
  paradise = todd.books.create!(title: "Paradise",
                            author:"David Wellington", 
                            genre: "Horror Fiction", 
                            year_written: 2023, 
                            fiction: true)

  penguins = penny.books.create!(title: "Mr Popper's Penguins",
                                author: "Richard & Florence Atwater", 
                                genre: "Children's literature", 
                                year_written: 1938, 
                                fiction: true)
  frindle = penny.books.create!(title: "Frindle", 
                                author: "Andrew Clements",
                                genre: "Children's literature",
                                year_written: 1996,
                                fiction: true)
  bob = vivian.books.create!(title: "Bob Books Collection 3", 
                              author: "Bobby Lynn and John Maslen",
                              genre: "first readers",
                              year_written: 2007,
                              fiction: true)
  pigs = vivian.books.create!(title: "The Three Pigs", 
                              author: "retold by April Macguire",
                              genre: "classic tales",
                              year_written: 2009,
                              fiction: true)
  
  
