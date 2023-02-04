# frozen_string_literal: true

# [ ] done

# User Story 4, Child Show

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

describe 'books show' do
  it 'should have the book with attributes' do
    author = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
    book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
    visit "/books/#{book.id}"
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.author_id)
    expect(page).to have_content(book.year_written)
    expect(page).to have_content(book.fiction)
    expect(page).to have_content(book.created_at)
    expect(page).to have_content(book.updated_at)
  end
end
