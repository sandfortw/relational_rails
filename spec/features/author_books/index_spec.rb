# frozen_string_literal: true

require 'rails_helper'

describe 'author books index' do
  it 'shows every book for an author with content' do
    @author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    @book = Book.create!(title: 'Outliers', author_id: @author.id, year_written: 2008, fiction: false)
    @book1 = Book.create!(title: 'Something book', author_id: @author.id, year_written: 2008, fiction: false)

    visit "/authors/#{@author.id}/books"
    expect(page).to have_content(@book.title)
    expect(page).to have_content(@book1.title)
    expect(page).to have_content(@book.year_written)
    expect(page).to have_content(@book.author_id)
    expect(page).to have_content(@book.fiction)
    expect(page).to have_content(@book.created_at)
    expect(page).to have_content(@book.updated_at)
  end

  it 'is in alphabetical order by title' do
    @author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    @c_book = Book.create!(title: 'Ccccc', author_id: @author.id, year_written: 2008, fiction: false)
    @b_book = Book.create!(title: 'Bbbbb', author_id: @author.id, year_written: 2008, fiction: false)
    @a_book = Book.create!(title: 'Aaaaa', author_id: @author.id, year_written: 2008, fiction: false)
    visit "/authors/#{@author.id}/books"

    expect(@a_book.title).to appear_before(@b_book.title)
    expect(@b_book.title).to appear_before(@c_book.title)
  end

  it 'should have an edit link' do #TODO: Make this test better
    @author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    @book = Book.create!(title: 'Outliers', author_id: @author.id, year_written: 2008, fiction: false)
    visit "/authors/#{@author.id}/books"
    expect(page).to have_content('Edit book')
  end
end
