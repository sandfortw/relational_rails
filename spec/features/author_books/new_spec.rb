# frozen_string_literal: true

require 'rails_helper'

describe 'new authorbook page' do
  describe 'form submission' do
    before :each do
      @author = Author.create!(name: 'Jane Austen', year_born: 1775, alive: false)
    end
    it 'should submit form and redirect to author\'s book page' do
      visit "/authors/#{@author.id}/books/new"
      fill_in 'book[title]', with: 'Pride and Prejudice'
      choose('Fiction')
      fill_in 'book[year_written]', with: 1813
      click_button 'Create Book'
      expect(current_path).to eq("/authors/#{@author.id}/books")
      expect(page).to have_content('Pride and Prejudice')
      expect(page).to have_content('true')
      expect(page).to have_content('1813')
      save_and_open_page
    end
  end
end
