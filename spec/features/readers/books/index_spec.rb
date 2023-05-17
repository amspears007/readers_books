require 'rails_helper'

  RSpec.describe 'Parent Child Index', type: :feature do
    let!(:amy) {Reader.create!(name: "Amy", age:40, avid_reader: false)}
    let!(:todd) {Reader.create!(name: "Todd", age:45, avid_reader: true)}
    let!(:penny) {Reader.create!(name: "Penny", age:8, avid_reader: false)}

    let!(:plum_creek) {amy.books.create!(title: "On the Banks of Plum Creek", author:"Laura Ingalls Wilder", genre: "children's historical novels", year_written: 1937, fiction: true)}
    let!(:nine) {amy.books.create!(title: "Nine Perfect Strangers", author:"Liane Moriarty", genre: "thriller", year_written: 2018, fiction: true)}
    let!(:gone) {amy.books.create!(title: "Then She was Gone", author:"Lisa Jewell", genre: "thriller", year_written: 2017, fiction: true)}
    let!(:deep_work) {amy.books.create!(title: "Deep Work", author:"Cal Newport", genre: "self help", year_written: 2016, fiction: false)}
    let!(:metal) {todd.books.create!(title: "The Lost Metal", author:"Brandon Sanderson", genre: "fantasy", year_written: 2022, fiction: true)}
    let!(:penguins) {penny.books.create!(title: "Mr Popper's Penguins", author: "Richard & Florence Atwater", genre:"Children's literature", fiction: true)}

  describe "US5 I visit '/readers/:reader_id/books'" do
    it "I see each book that is associated with that reader with each book's attributes" do
      visit "/readers/#{amy.id}/books"

      within("h1") do
        expect(page).to have_content("#{amy.name}'s Most Recent Books")
      end
       within("#reader-#{amy.id}") do
        expect(page).to have_content(plum_creek.title)
        expect(page).to have_content(plum_creek.author)
        expect(page).to have_content(plum_creek.genre)
        expect(page).to have_content(deep_work.title)
        expect(page).to have_content(deep_work.author)
        expect(page).to have_content(gone.title)
        expect(page).to have_content(gone.genre)
        expect(page).to_not have_content(metal.title)
        expect(page).to_not have_content(penguins.title)
        end        
      end
    end

    describe "US13  Parent Child Creation" do
      it "I see a link to add a new adoptable book for that parent 'Create Book'" do
        visit "/readers/#{amy.id}/books"
        # save_and_open_page
        expect(page).to have_link("New Book")
        click_link("New Book")
        expect(current_path).to eq("/readers/#{amy.id}/books/new")

        fill_in "title", with: "American Dirt" 
        fill_in "author", with: "Jeanine Cummins" 
        fill_in "genre", with: "thriller"
        fill_in "year_written", with: "2020"

        fill_in "fiction", with: "true"
        click_on "Create Book"

        expect(current_path).to eq("/readers/#{amy.id}/books")
        expect(page).to have_content("American Dirt")
      end
    end

    describe "US16 Sort Parent's Children in Alphabetical Order by name" do
      it "I see a link to sort book titles in alphabetical order" do
        visit "/readers/#{amy.id}/books"
        expect(plum_creek.title).to appear_before(nine.title)
        
        click_link("Index Alphabetically")
        save_and_open_page
        
        expect(current_path).to eq("/readers/#{amy.id}/books")
        expect(deep_work.title).to appear_before(plum_creek.title)
        expect(nine.title).to appear_before(gone.title)
        expect(plum_creek.title).to appear_before(gone.title)
      end
    end

    describe "Display Records Over a Given Threshold" do
      it "I see a form that allows me to input a number value and when I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
      Then I am brought back to the current index page with only the records that meet that threshold shown." do
        visit "/readers/#{amy.id}/books"

        expect(page).to have_button("Only return book records after _ of year_written")
        fill_in :year_written, with: 2017
        click_button("Only return book records after _ of year_written")
        
        expect(current_path).to eq("/readers/#{amy.id}/books")

        expect(page).to have_content(plum_creek.title)
        expect(page).to have_content(deep_work.title)
        expect(page).to_not have_content(nine.title)
        expect(page).to_not have_content(gone.title)

      end
    end
  end
