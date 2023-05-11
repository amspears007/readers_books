require 'rails_helper'

  RSpec.describe 'Child Index', type: :feature do
    let!(:amy) {Reader.create!(name: "Amy", age:40, avid_reader: false)}
    let!(:todd) {Reader.create!(name: "Todd", age:45, avid_reader: true)}
    let!(:penny) {Reader.create!(name: "Penny", age:8, avid_reader: false)}


    let!(:plum_creek) {amy.books.create!(title: "On the Banks of Plum Creek", 
                                        author:"Laura Ingalls Wilder", 
                                        genre: "children's historical novels", 
                                        year_written: 1937, 
                                        fiction: true)}
    let!(:gone) {amy.books.create!(title: "Then She was Gone", 
                                  author:"Lisa Jewell", 
                                  genre: "thriller", 
                                  year_written: 2017, 
                                  fiction: true)}
    let!(:deep_work) {amy.books.create!(title: "Deep Work",
                                        author:"Cal Newport", 
                                        genre: "self help", 
                                        year_written: 2016, 
                                        fiction: false)}
    let!(:metal) {todd.books.create!(title: "The Lost Metal", 
                                    author:"Brandon Sanderson", 
                                    genre: "fantasy", 
                                    year_written: 2022, 
                                    fiction: true)}
    let!(:penguins) {penny.books.create!(title: "Mr Popper's Penguins", 
                                        author: "Richard & Florence Atwater", 
                                        genre:"Children's literature", 
                                        year_written: 1938, 
                                        fiction: true)}

    describe "US4 When I visit '/child_table_name/:id'" do
      it "I see the child with that id including the child's attributes" do
        visit "/books/#{penguins.id}"
        save_and_open_page
        within("h1") do
          expect(page).to have_content("Book Show Page")
        end
        expect(page).to have_content("Title: #{penguins.title}")
        expect(page).to have_content("Written By: #{penguins.author}")
        expect(page).to have_content("Genre: #{penguins.genre}")
        expect(page).to have_content("Year Published: #{penguins.year_written}")
        expect(page).to have_content("Fiction Classification: #{penguins.fiction}")
        end
      end
    end
