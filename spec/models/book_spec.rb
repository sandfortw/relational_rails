# frozen_string_literal: true

require 'rails_helper'

describe Book do
  describe 'instance methods' do
    describe '#title' do
      it 'returns the title' do
        author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
        book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
        expect(book.title).to eq('Outliers')
      end
    end

    describe '#author_id' do
      it 'returns the author_id' do
        author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
        book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
        expect(book.author_id).to eq(author.id)
      end
    end

    describe '#year_written' do
      it 'returns the year written' do
        author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
        book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
        expect(book.year_written).to eq(2008)
      end
    end

    describe '#fiction?' do
      it 'returns false if non-fiction' do
        author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
        book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
        expect(book.fiction?).to eq(false)
      end

      it 'returns true if fiction' do
        author = Author.create!(name: 'Mark Twain', year_born: 1835, alive: false)
        book = Book.create!(title: 'The Adventures of Tom Sawyer', author_id: author.id, year_written: 1876,
                            fiction: true)
        expect(book.fiction?).to eq(true)
      end
    end

    describe '#created_at' do
      it 'returns a time' do
        author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
        book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
        expect(book.created_at).to be_a(Time)
      end
    end

    describe '#updated_at' do
      it 'returns a time' do
        author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
        book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
        expect(book.updated_at).to be_a(Time)
      end
    end
  end
end
