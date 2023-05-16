require 'rails_helper'

  RSpec.describe 'Child Index', type: :feature do
    let!(:amy) {Reader.create!(name: "Amy", age:40, avid_reader: false)}
    let!(:todd) {Reader.create!(name: "Todd", age:45, avid_reader: true)}
    let!(:penny) {Reader.create!(name: "Penny", age:8, avid_reader: false)}


    let!(:plum_creek) {amy.books.create!(title: "On the Banks of Plum Creek", author:"Laura Ingalls Wilder", genre: "children's historical novels", year_written: 1937, fiction: true)}
    let!(:gone) {amy.books.create!(title: "Then She was Gone", author:"Lisa Jewell", genre: "thriller", year_written: 2017, fiction: true)}
    let!(:deep_work) {amy.books.create!(title: "Deep Work", author:"Cal Newport", genre: "self help", year_written: 2016, fiction: false)}
    let!(:metal) {todd.books.create!(title: "The Lost Metal", author:"Brandon Sanderson", genre: "fantasy", year_written: 2022, fiction: true)}
    let!(:penguins) {penny.books.create!(title: "Mr Popper's Penguins", author: "Richard & Florence Atwater", genre:"Children's literature", year_written: 1938, fiction: true)}

    describe "US3 As a visitor When I visit '/child_table_name' " do
      it " I see each book in the system including the book's attributes" do
        visit "/books"
        save_and_open_page

        within("h1") do
          expect(page).to have_content("Books Index Page")
        end

        within("#book-info-#{plum_creek.id}") do
          expect(page).to have_content("Title: #{plum_creek.title}")
          expect(page).to have_content("Author: #{plum_creek.author}")
          expect(page).to have_content("Genre: #{plum_creek.genre}")
          expect(page).to have_content("Year Written: #{plum_creek.year_written}")
          expect(page).to have_content("Fiction: #{plum_creek.fiction}")
        end

        within("#book-info-#{gone.id}") do
          expect(page).to have_content("Title: #{gone.title}")
          expect(page).to have_content("Author: #{gone.author}")
          expect(page).to have_content("Genre: #{gone.genre}")
          expect(page).to have_content("Year Written: #{gone.year_written}")
          expect(page).to have_content("Fiction: #{gone.fiction}")
        end

        within("#book-info-#{penguins.id}") do
          expect(page).to have_content("Title: #{penguins.title}")
          expect(page).to have_content("Author: #{penguins.author}")
          expect(page).to have_content("Genre: #{penguins.genre}")
          expect(page).to have_content("Year Written: #{penguins.year_written}")
          expect(page).to have_content("Fiction: #{penguins.fiction}")
        end
      end
    end
    
    describe "US15 Child Index only shows `true` Records" do
      it "I only see books where fiction column is `true`" do
        visit "/books"

        expect(page).to have_content(plum_creek.title)
        expect(page).to have_content(gone.title)
        expect(page).to have_content(penguins.title)
        expect(page).to have_content(metal.title)
        expect(page).to_not have_content(deep_work.title)
      end
    end
  end