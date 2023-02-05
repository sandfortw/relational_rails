# frozen_string_literal: true

require 'rails_helper'

describe 'author show page' do
  it 'should show the author with the correct id and attributes' do
    author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
    visit "/authors/#{author.id}"
    expect(page).to have_content(author.name)
    expect(page).to have_content(author.year_born)
    expect(page).to have_content(author.alive)
    expect(page).to have_content(author.created_at)
    expect(page).to have_content(author.updated_at)
  end

  it 'should have a count of the number of children' do
    author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
    book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
    book1 = Book.create!(title: 'Something book', author_id: author.id, year_written: 2008, fiction: false)
    visit "/authors/#{author.id}"
    expect(page).to have_content('Book count: 2')
  end

  it 'should have a link to its book page' do
    author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
    book = Book.create!(title: 'Outliers', author_id: author.id, year_written: 2008, fiction: false)
    book1 = Book.create!(title: 'Something book', author_id: author.id, year_written: 2008, fiction: false)
    visit "/authors/#{author.id}"
    click_link('Books')
    expect(current_path).to eq("/authors/#{author.id}/books")
  end

  it 'should have a link to edit the author' do
    author = Author.create!(name: 'Mary Shelley', year_born: 1797, alive: false)
    visit "/authors/#{author.id}"
    click_link('Update Author')
    expect(current_path).to eq("/authors/#{author.id}/edit")
  end
end
