require "rails_helper"

RSpec.describe Reader, type: :model do
  let!(:amy) {Reader.create!(name: "Amy", age:40, avid_reader: false, created_at: 1.day.ago)}
  let!(:todd) {Reader.create!(name: "Todd", age:45, avid_reader: true, created_at: 2.days.ago)}
  let!(:penny) {Reader.create!(name: "Penny", age:8, avid_reader: false, created_at: 3.days.ago)}
  let!(:vivian) {Reader.create!(name: "Vivian", age:5, avid_reader: true)}

   
  let!(:plum_creek) {amy.books.create!(title: "On the Banks of Plum Creek", author:"Laura Ingalls Wilder", genre: "children's historical novels", year_written: 1937, fiction: true)}
  let!(:gone) {amy.books.create!(title: "Then She was Gone", author:"Lisa Jewell", genre: "thriller", year_written: 2017, fiction: true)}
  let!(:deep_work) {amy.books.create!(title: "Deep Work", author:"Cal Newport", genre: "self help", year_written: 2016, fiction: false)}
  let!(:metal) {todd.books.create!(title: "The Lost Metal", author:"Brandon Sanderson", genre: "fantasy", year_written: 2022, fiction: true)}
  let!(:penguins) {penny.books.create!(title: "Mr Popper's Penguins", author: "Richard & Florence Atwater", genre:"Children's literature", fiction: true)}

  describe 'relationships' do
    it {should have_many :books}

    describe "US6 it sorts by most recently created " do
      it "#sort by Most Recently Created " do

      expect(Reader.sort_by_most_recently_created).to eq([vivian, amy, todd, penny])
      end
    end

    describe "US7 It counts number of books" do
      it "::book_count" do
      
        expect(amy.book_count).to eq(3)
        expect(penny.book_count).to eq(1)
        expect(vivian.book_count).to eq(0)
      end
    end

    describe "US16 Sort Parent's Children in Alphabetical Order by name" do
      it "sorts_alphabetically" do
          
          expect(amy.sorts_alphabetically("true")).to eq([deep_work, plum_creek, gone])
      end
    end

    describe "Finds threshold" do
      it "::books_before" do

        expect(amy.books_before(2017)).to eq([ plum_creek, deep_work])
      end
    end
  end
end