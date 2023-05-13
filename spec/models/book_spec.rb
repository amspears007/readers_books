require "rails_helper"

RSpec.describe Book, type: :model do
  let!(:amy) {Reader.create!(name: "Amy", age:40, avid_reader: false)}
  let!(:todd) {Reader.create!(name: "Todd", age:45, avid_reader: true)}
  let!(:penny) {Reader.create!(name: "Penny", age:8, avid_reader: false)}

  let!(:plum_creek) {amy.books.create!(title: "On the Banks of Plum Creek", author:"Laura Ingalls Wilder", genre: "children's historical novels", year_written: 1937, fiction: true)}
  let!(:gone) {amy.books.create!(title: "Then She was Gone", author:"Lisa Jewell", genre: "thriller", year_written: 2017, fiction: true)}
  let!(:deep_work) {amy.books.create!(title: "Deep Work", author:"Cal Newport", genre: "self help", year_written: 2016, fiction: false)}
  let!(:metal) {todd.books.create!(title: "The Lost Metal", author:"Brandon Sanderson", genre: "fantasy", year_written: 2022, fiction: true)}
  let!(:penguins) {penny.books.create!(title: "Mr Popper's Penguins", author: "Richard & Florence Atwater", genre:"Children's literature", year_written: 1938, fiction: true)}

  describe "relationships" do
    it { should belong_to :reader}

  describe "US15 records where boolean is true" do
    it "#boolean_is_true" do

      expect(Book.boolean_is_true).to eq([plum_creek, gone, metal, penguins])
      end
    end
  end
end