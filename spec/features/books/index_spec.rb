# frozen_string_literal: true

require 'rails_helper'

describe 'books index' do
  before :each do
    @author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    @book = Book.create!(title: 'Outliers', author_id: @author.id, year_written: 2008, fiction: true)
    @author1 = Author.create!(name: 'Someone else', year_born: 1961, alive: true)
    @book1 = Book.create!(title: 'Something book', author_id: @author1.id, year_written: 2008, fiction: true)
  end

  it 'should have each book in the database' do
    visit '/books/'
    expect(page).to have_content(@book.title)
    expect(page).to have_content(@book1.title)
  end

  it 'should have the attributes of the book' do
    visit '/books/'
    expect(page).to have_content(@book.title)
    expect(page).to have_content(@book.author_id)
    expect(page).to have_content(@book.year_written)
    expect(page).to have_content(@book.fiction)
  end

  it 'should only be fiction (true bool) books' do
    @book3 = Book.create!(title: 'Nonfiction Book', author_id: @author1.id, year_written: 1999, fiction: false)
    visit '/books/'
    expect(page).to have_content(@book.title)
    expect(page).not_to have_content(@book3.title)
  end

  it 'should have an edit link' do #TODO: Make this test better
    visit '/books/'
    expect(page).to have_content('Edit book')
  end
end
