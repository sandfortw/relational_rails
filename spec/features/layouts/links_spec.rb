# frozen_string_literal: true

require 'rails_helper'

describe 'links' do
  describe 'Books Index Links' do
    it 'should have a link to the books index from authors index' do
      visit '/authors/'
      expect(page).to have_content('Books Index')
      click_link('Books Index')
      expect(current_path).to eq('/books')
    end

    it 'is on every page' do
      visit '/books/'
      expect(page).to have_content('Books Index')
      click_link('Books Index')
      expect(current_path).to eq('/books')
      author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
      visit "/authors/#{author.id}"
      click_link('Books Index')
      expect(current_path).to eq('/books')
      book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
      visit "/books/#{book.id}"
      click_link('Books Index')
      expect(current_path).to eq('/books')
      visit "/authors/#{author.id}/books"
      click_link('Books Index')
      expect(current_path).to eq('/books')
    end
  end

  describe 'Authors Index Links' do
    it 'should have a link to the authors index from books index' do
      visit '/books/'
      expect(page).to have_content('Authors Index')
      click_link('Authors Index')
      expect(current_path).to eq('/authors')
    end

    it 'is on every page' do
      visit '/books/'
      expect(page).to have_content('Books Index')
      click_link('Authors Index')
      expect(current_path).to eq('/authors')
      author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
      visit "/authors/#{author.id}"
      click_link('Authors Index')
      expect(current_path).to eq('/authors')
      book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
      visit "/books/#{book.id}"
      click_link('Authors Index')
      expect(current_path).to eq('/authors')
      visit "/authors/#{author.id}/books"
      click_link('Authors Index')
      expect(current_path).to eq('/authors')
    end
  end
end
