require 'rails_helper'

  RSpec.describe 'Parent Show', type: :feature do
    let!(:amy) {Reader.create!(name: "Amy", age:40, avid_reader: false)}
    let!(:todd) {Reader.create!(name: "Todd", age:45, avid_reader: true)}
    let!(:penny) {Reader.create!(name: "Penny", age:8, avid_reader: false)}

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
          expect(page).to_not have_content("Age: #{todd.age}")

          end
        end

    describe "US7 When Parent Child Count" do
      it "I see a count of the number of children associated with this parent" do
        visit "/readers/#{amy.id}"

        expect(page).to have_content("Number of Books: 3")
    end
  end

    describe "US8 Child Index Link"
      it "I see a link at the top of the page that takes me to the Child Index" do
        visit "/readers/#{amy.id}"

        expect(page).to have_link("List All Readers")
        click_link "List All Readers"
        expect(current_path).to eq("/readers")
      end

    describe "US9 Parent Index Link" do
      it "I see a link at the top of the page that takes me to the Child Index" do
        visit "/readers/#{amy.id}"

        expect(page).to have_link("List All Books")
        click_link "List All Books"
        expect(current_path).to eq("/books")
        end
      end


    describe "US10 Parent Child Index Link" do
      it "I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')" do
        visit "/readers/#{amy.id}"

        expect(page).to have_link("List of #{amy.name}'s Books")
        click_link "List of #{amy.name}'s Books"
        expect(current_path).to eq("/readers/#{amy.id}/books")
        end
      end
    end
  end
    