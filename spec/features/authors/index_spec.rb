# frozen_string_literal: true

require 'rails_helper'

describe 'the author index page' do
  before :each do
    @author = Author.create!(name: 'Shakespeare', year_born: 1564, alive: false)
    @author2 = Author.create!(name: 'Malcolm Gladwell', year_born: 1963, alive: true)
  end

  it 'should display the name of each parent record in the system' do
    visit '/authors'
    expect(page).to have_content(@author.name)
    expect(page).to have_content(@author2.name)
  end

  it 'should be ordered by most recently created record' do
    visit '/authors'
    expect(@author2.name).to appear_before(@author.name)
  end

  it 'should have a link called "New Author" that redirects when I click' do
    visit '/authors'
    expect(page).to have_content('New Author')
    click_link('New Author')
    expect(current_path).to eq('/authors/new')
  end

  it 'should delete an author' do
    visit '/authors'
    click_link("Delete #{@author.name}")
    expect(current_path).to eq('/authors')
    expect(page).to_not have_content(@author.name)
  end

  it 'should delete an author with books' do
    author = Author.create!(name: 'Someone', year_born: 1963, alive: true)
    book1 = Book.create!(title: 'One', author_id: author.id, year_written: 2008, fiction: false)
    book2 = Book.create!(title: 'Two', author_id: author.id, year_written: 2009, fiction: false)
    book3 = Book.create!(title: 'Three', author_id: author.id, year_written: 1999, fiction: false)
    book4 = Book.create!(title: 'Four', author_id: author.id, year_written: 1998, fiction: false)
    visit '/authors'
    expect(page).to have_content(author.name)
    click_link("Delete #{author.name}")
    expect(current_path).to eq('/authors')
    expect(page).to_not have_content(author.name)
  end

  it 'should have a link that sorts each author by book count' do
    author = Author.create!(name: 'Someone', year_born: 1963, alive: true)
    book1 = Book.create!(title: 'One', author_id: author.id, year_written: 2008, fiction: false)
    book2 = Book.create!(title: 'Two', author_id: author.id, year_written: 2009, fiction: false)
    book3 = Book.create!(title: 'Three', author_id: author.id, year_written: 1999, fiction: false)
    book4 = Book.create!(title: 'Four', author_id: @author2.id, year_written: 1998, fiction: false)
    visit '/authors'
    expect(page).not_to have_content("Book Count:")
    click_link "Sort by number of books"
    expect(current_path).to eq('/authors')
    expect(page).to have_content("Book Count: 3")
    expect(page).to have_content("Book Count: 1")
    expect(page).to have_content("Book Count: 0")
    expect(author.name).to appear_before(@author2.name)
    expect(@author2.name).to appear_before(@author.name)
  end
end


describe 'update author link' do
  it 'should have a link to edit the author' do
    author = Author.create!(name: 'Mary Shelley', year_born: 1797, alive: false)
    visit '/authors'
    click_link("Update #{author.name}")
    expect(current_path).to eq("/authors/#{author.id}/edit")
  end
end