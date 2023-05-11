require 'rails_helper'

  RSpec.describe 'Parent Child Index', type: :feature do
    let!(:amy) {Reader.create!(name: "Amy", age:40, avid_reader: false)}
    let!(:todd) {Reader.create!(name: "Todd", age:45, avid_reader: true)}
    let!(:penny) {Reader.create!(name: "Penny", age:8, avid_reader: false)}


    let!(:plum_creek) {amy.books.create!(title: "On the Banks of Plum Creek", author:"Laura Ingalls Wilder", genre: "children's historical novels", year_written: 1937, fiction: true)}
    let!(:gone) {amy.books.create!(title: "Then She was Gone", author:"Lisa Jewell", genre: "thriller", year_written: 2017, fiction: true)}
    let!(:deep_work) {amy.books.create!(title: "Deep Work", author:"Cal Newport", genre: "self help", year_written: 2016, fiction: false)}
    let!(:metal) {todd.books.create!(title: "The Lost Metal", author:"Brandon Sanderson", genre: "fantasy", year_written: 2022, fiction: true)}
    let!(:penguins) {penny.books.create!(title: "Mr Popper's Penguins", author: "Richard & Florence Atwater", genre:"Children's literature", fiction: true)}

  describe "US5 I visit '/readers/:reader_id/books'" do
    it "I see each book that is associated with that reader with each book's attributes" do
      visit "/readers/#{amy.id}/books"
save_and_open_page
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
  end
