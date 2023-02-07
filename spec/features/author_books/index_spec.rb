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

  it 'you can click a link to sort alphabetically by title' do
    @author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    @c_book = Book.create!(title: 'Ccccc', author_id: @author.id, year_written: 2008, fiction: false)
    @b_book = Book.create!(title: 'Bbbbb', author_id: @author.id, year_written: 2008, fiction: false)
    @a_book = Book.create!(title: 'Aaaaa', author_id: @author.id, year_written: 2008, fiction: false)
    visit "/authors/#{@author.id}/books"
    expect(@a_book.title).to_not appear_before(@b_book.title)
    expect(@b_book.title).to_not appear_before(@c_book.title)
    click_link "Sort Books Alphabetically"
    expect(@a_book.title).to appear_before(@b_book.title)
    expect(@b_book.title).to appear_before(@c_book.title)
  end

  it 'should have an edit link' do #TODO: Make this test better
    @author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    @book = Book.create!(title: 'Outliers', author_id: @author.id, year_written: 2008, fiction: false)
    visit "/authors/#{@author.id}/books"
    expect(page).to have_content('Edit book')
  end

  it 'should have a form that only returns books after a certain year' do
    @author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    @book1 = Book.create!(title: 'Outliers', author_id: @author.id, year_written: 2008, fiction: false)
    @book2 = Book.create!(title: 'Two', author_id: @author.id, year_written: 2009, fiction: false)
    @book3 = Book.create!(title: 'Three', author_id: @author.id, year_written: 1999, fiction: false)
    @book4 = Book.create!(title: 'Four', author_id: @author.id, year_written: 1998, fiction: false)
    visit "/authors/#{@author.id}/books"
    expect(page).to have_content("Only show books written after (year):")
    fill_in "year_floor", with: 2000
    click_on "Submit"
    expect(current_path).to eq("/authors/#{@author.id}/books")
    expect(page).to_not have_content(@book3.title)
    expect(page).to_not have_content(@book4.title)
    expect(page).to have_content(@book1.title)
    expect(page).to have_content(@book2.title)
  end
end
