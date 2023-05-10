require 'rails_helper'

  RSpec.describe 'Parent Show', type: :feature do
    let!(:amy) {Reader.create!(name: "Amy Spears", age:40, avid_reader: false)}
    let!(:todd) {Reader.create!(name: "Todd Van Wiel", age:45, avid_reader: true)}
    let!(:penny) {Reader.create!(name: "Penny Van Wiel", age:8, avid_reader: false)}


    let!(:plum_creek) {amy.books.create!(title: "On the Banks of Plum Creek", author:"Laura Ingalls Wilder", genre: "children's historical novels", year_written: 1937, fiction: true)}
    let!(:gone) {amy.books.create!(title: "Then She was Gone", author:"Lisa Jewell", genre: "thriller", year_written: 2017, fiction: true)}
    let!(:deep_work) {amy.books.create!(title: "Deep Work", author:"Cal Newport", genre: "self help", year_written: 2016, fiction: false)}
    let!(:metal) {todd.books.create!(title: "The Lost Metal", author:"Brandon Sanderson", genre: "fantasy", year_written: 2022, fiction: true)}

    describe "US2 When I visit '/readers/:id' " do
      it "I see the parent with that id including the parent's attributes (data from each column that is on the parent table)" do
        visit "/readers/#{amy.id}"
        save_and_open_page

        within("h3") do
          expect(page).to have_content("Reader Show Page of #{amy.name}")
        end

        within("#reader-#{amy.id}") do
          expect(page).to have_content("Age: #{amy.age}")
          expect(page).to have_content("Avid Reader: #{amy.avid_reader}")
          end
        end
      end
    end
    