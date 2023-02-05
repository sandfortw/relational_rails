# frozen_string_literal: true

require 'rails_helper'

describe 'books edit view' do
  describe 'the form' do
    before :each do
      @time_updated = Time.now
      @time_created = Time.new(2022, 0o1, 0o1, 12, 0, 0, '+09:00')
      allow(Time).to receive(:now).and_return(@time_created)
      @author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
      @book = Book.create!(title: 'Outliers', author_id: @author.id, year_written: 2008, fiction: false)
    end
    it 'starts prefilled' do
      visit "/books/#{@book.id}/edit"
      expect(page).to have_field('book[title]', with: 'Outliers')
      expect(page).to have_field('book[year_written]', with: 2008)
      expect(page).to have_field('book[author_id]', with: @author.id)
      expect(page).to have_checked_field('book[fiction]') # TODO: check if this is marking the correct radio
    end

    it 'redirects to the book\'s show page' do
      visit "/books/#{@book.id}/edit"
      click_button 'Update Book'
      expect(current_path).to eq("/books/#{@book.id}")
    end

    it 'updates the books information' do
      visit "/books/#{@book.id}/edit"
      allow(Time).to receive(:now).and_return(@time_updated)
      fill_in 'book[title]', with: 'Something Else'
      fill_in 'book[year_written]', with: 1992
      choose('Fiction')
      click_button 'Update Book'
      expect(page).to have_content('Something Else')
      expect(page).to have_content('Year written: 1992')
      expect(page).to have_content('Fiction?: true')
      expect(page).to have_content("Updated at: #{@time_updated}")
      expect(page).to have_content("Created at: #{@time_created}")
    end
  end
end
