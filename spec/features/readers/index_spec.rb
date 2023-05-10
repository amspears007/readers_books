require 'rails_helper'

  RSpec.describe 'Parent Index', type: :feature do
    let!(:amy) {Reader.create!(name: "Amy", age:40, avid_reader: false)}
    let!(:todd) {Reader.create!(name: "Todd", age:45, avid_reader: true)}
    let!(:penny) {Reader.create!(name: "Penny", age:8, avid_reader: false)}


    let!(:plum_creek) {amy.books.create!(title: "On the Banks of Plum Creek", author:"Laura Ingalls Wilder", genre: "children's historical novels", year_written: 1937, fiction: true)}
    let!(:gone) {amy.books.create!(title: "Then She was Gone", author:"Lisa Jewell", genre: "thriller", year_written: 2017, fiction: true)}
    let!(:deep_work) {amy.books.create!(title: "Deep Work", author:"Cal Newport", genre: "self help", year_written: 2016, fiction: false)}
    let!(:metal) {todd.books.create!(title: "The Lost Metal", author:"Brandon Sanderson", genre: "fantasy", year_written: 2022, fiction: true)}
    let!(:penguins) {penny.books.create!(title: "Mr Popper's Penguins", author: "Richard & Florence Atwater", genre:"Children's literature", ficiton: true)}

    describe "US1 When I visit '/readers' " do
      it "Then I see the name of each parent record in the system" do
        visit "/readers"

        within("h3") do
          expect(page).to have_content("Reader Index Page") 
        end
        expect(page).to have_content("Amy") 
        expect(page).to have_content("Todd") 

        expect(page).to have_content("#{todd.name}") 
        expect(page).to have_content("#{penny.name}") 
      
    end
  end
end
