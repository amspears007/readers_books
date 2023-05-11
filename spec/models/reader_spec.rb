require "rails_helper"

RSpec.describe Reader, type: :model do
  describe 'relationships' do
    it {should have_many :books}

    describe "US6 it sorts by most recently created " do
      let!(:amy) {Reader.create!(name: "Amy", age:40, avid_reader: false, created_at: 1.day.ago)}
      let!(:todd) {Reader.create!(name: "Todd", age:45, avid_reader: true, created_at: 2.days.ago)}
      let!(:penny) {Reader.create!(name: "Penny", age:8, avid_reader: false, created_at: 3.days.ago)}
      let!(:vivian) {Reader.create!(name: "Vivian", age:5, avid_reader: true)}


      it "#sort by Most Recently Created " do

      expect(Reader.sort_by_most_recently_created).to eq([vivian, amy, todd, penny])
      end
    end

    describe "US7 It counts number of books" do
      it "::book_count" do
        expect(amy.book_count).to eq(3)
      end
    end
  end
end