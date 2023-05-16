require 'rails_helper'

  RSpec.describe 'Child Show', type: :feature do
    let!(:amy) {Reader.create!(name: "Amy", age:40, avid_reader: false)}
    let!(:todd) {Reader.create!(name: "Todd", age:45, avid_reader: true)}
    let!(:penny) {Reader.create!(name: "Penny", age:8, avid_reader: false)}

    let!(:bossy) {amy.books.create!(title: "Bossypants", author: "Tina Fay", 
                                    genre: "autobiographical comedy", 
                                    year_written: 2011, 
                                    fiction: false)}

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

    describe "US14 Child Update" do
      it "I see a link to update that Child 'Update Book' when I click the link I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes.  When I click the button to submit the form 'Update Book" do 
        visit "books/#{metal.id}"

        expect(page).to have_link("Update Book")
        click_link("Update Book")
        expect(current_path).to eq("/books/#{metal.id}/edit")

        fill_in "genre", with: "sci-fi"
        click_on "Update Book"

        expect(current_path).to eq("/books/#{metal.id}")
        expect(page).to have_content("sci-fi")
        expect(page).to_not have_content("fantasy")
      end
    end

    describe "US20 Child Delete" do
      it "I see a link to delete the child 'Delete Book' When I click the link
      Then a 'DELETE' request is sent to '/child_table_name/:id',the child is deleted,
      and I am redirected to the child index page where I no longer see this child" do
        visit "/books/#{bossy.id}"

        expect(page).to have_link("Delete #{bossy.title}")
        click_link("Delete #{bossy.title}")
        expect(current_path).to eq("/books")

        expect(page).to_not have_content(bossy.title)
        expect(page).to_not have_content(bossy.author)
      end
    end
  end
